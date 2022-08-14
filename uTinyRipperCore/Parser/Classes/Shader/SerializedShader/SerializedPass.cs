using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace uTinyRipper.Classes.Shaders
{
	public struct SerializedPass : IAssetReadable
	{
		/// <summary>
		/// 2019.3 and greater
		/// </summary>
		public static bool HasProgRayTracing(Version version) => version.IsGreaterEqual(2019, 3);

		public void Read(AssetReader reader)
		{
			m_nameIndices = new Dictionary<string, int>();

			m_nameIndices.Read(reader);
			Type = (SerializedPassType)reader.ReadInt32();
			State.Read(reader);
			ProgramMask = reader.ReadUInt32();
			ProgVertex.Read(reader);
			ProgFragment.Read(reader);
			ProgGeometry.Read(reader);
			ProgHull.Read(reader);
			ProgDomain.Read(reader);
			if (HasProgRayTracing(reader.Version))
			{
				ProgRayTracing.Read(reader);
			}
			HasInstancingVariant = reader.ReadBoolean();
			reader.AlignStream();

			UseName = reader.ReadString();
			Name = reader.ReadString();
			TextureName = reader.ReadString();
			Tags.Read(reader);
		}

		public static SerializedPass shader;
		public void Export(ShaderWriter writer)
		{
			shader = this;
			writer.WriteIndent(2);
			writer.Write("{0} ", Type.ToString());

			if (Type == SerializedPassType.UsePass)
			{
				writer.Write("\"{0}\"\n", UseName);
			}
			else
			{
				writer.Write("{\n");

				if (Type == SerializedPassType.GrabPass)
				{
					if (TextureName.Length > 0)
					{
						writer.WriteIndent(3);
						writer.Write("\"{0}\"\n", TextureName);
					}
				}
				else if (Type == SerializedPassType.Pass)
				{
					State.Export(writer);
					
					ExportHLSLForCompilation(writer);
					
					//
					// if ((ProgramMask & ShaderType.Vertex.ToProgramMask()) != 0)
					// {
					// 	ProgVertex.Export(writer, ShaderType.Vertex);
					// }
					// if ((ProgramMask & ShaderType.Fragment.ToProgramMask()) != 0)
					// {
					// 	ProgFragment.Export(writer, ShaderType.Fragment);
					// }
					// if ((ProgramMask & ShaderType.Geometry.ToProgramMask()) != 0)
					// {
					// 	ProgGeometry.Export(writer, ShaderType.Geometry);
					// }
					// if ((ProgramMask & ShaderType.Hull.ToProgramMask()) != 0)
					// {
					// 	ProgHull.Export(writer, ShaderType.Hull);
					// }
					// if ((ProgramMask & ShaderType.Domain.ToProgramMask()) != 0)
					// {
					// 	ProgDomain.Export(writer, ShaderType.Domain);
					// }
					// if ((ProgramMask & ShaderType.RayTracing.ToProgramMask()) != 0)
					// {
					// 	ProgDomain.Export(writer, ShaderType.RayTracing);
					// }


#warning HasInstancingVariant?
				}
				else
				{
					throw new NotSupportedException($"Unsupported pass type {Type}");
				}

				writer.WriteIndent(2);
				writer.Write("}\n");
			}
		}

		private void ExportHLSLForCompilation(ShaderWriter writer)
		{
			writer.WriteIndent(3);
			writer.WriteLine("CGPROGRAM");
			writer.WriteIndent(3);
			writer.WriteLine("#pragma vertex vert");
			writer.WriteIndent(3);
			writer.WriteLine("#pragma fragment frag");
			writer.WriteIndent(3);
			writer.WriteLine("#include \"UnityCG.cginc\"");

			// Force instancing keyword to handle cases where it isn't present.
			// If we don't do this, the asset bundle building step might strip out the variants we need.
			writer.WriteIndent(3);
			writer.WriteLine("#pragma shader_feature STEREO_INSTANCING_ON");

			HashSet<string> localKeywords = new HashSet<string>();
			HashSet<string> globalKeywords = new HashSet<string>();
			
			int platformPC = writer.Shader.Platforms.IndexOf(GPUPlatform.d3d11);

			var enumerator = new[] { ProgVertex, ProgFragment, ProgGeometry, ProgHull, ProgDomain }.SelectMany(e => e.SubPrograms);
			foreach (SerializedSubProgram serializedSubProgram in enumerator)
			{
				ShaderSubProgram subProgram = writer.Shader.Blobs[platformPC].SubPrograms[serializedSubProgram.BlobIndex];
				
				globalKeywords.UnionWith(subProgram.GlobalKeywords);
				if (subProgram.LocalKeywords != null)
					localKeywords.UnionWith(subProgram.LocalKeywords);
			}

			foreach (string globalKeyword in globalKeywords)
			{
				writer.WriteIndent(3);
				writer.WriteLine($"#pragma shader_feature {globalKeyword}");
			}
			
			foreach (string localKeyword in localKeywords)
			{
				writer.WriteIndent(3);
				writer.WriteLine($"#pragma shader_feature_local {localKeyword}");
			}

			HashSet<string> allKeywords = new HashSet<string>(localKeywords);
			allKeywords.UnionWith(globalKeywords);

			foreach (SerializedSubProgram serializedSubProgram in enumerator)
			{
				SerializedSubProgram targetProgram = serializedSubProgram;
				ShaderSubProgram subProgram = writer.Shader.Blobs[platformPC].SubPrograms[targetProgram.BlobIndex];

				HashSet<string> programKeywords = new HashSet<string>(subProgram.GlobalKeywords);
				if (subProgram.LocalKeywords != null)
					programKeywords.UnionWith(subProgram.LocalKeywords);
				
				HashSet<string> excludedKeywords = new HashSet<string>(allKeywords);
				excludedKeywords.ExceptWith(subProgram.GlobalKeywords);
				if (subProgram.LocalKeywords != null)
					excludedKeywords.ExceptWith(subProgram.LocalKeywords);

				// If this is a stereo instancing pass
				if (programKeywords.Contains("STEREO_INSTANCING_ON"))
				{
					// Check if the program actually does instancing logic
					bool usesInstanceID = false;
					if (targetProgram.GpuProgramType == (int)ShaderGpuProgramType.DX11VertexSM40 ||
						targetProgram.GpuProgramType == (int)ShaderGpuProgramType.DX11VertexSM50)
					{
						// If this is a vertex shader, we expect to see an SV_InstanceID
						usesInstanceID = Encoding.Default.GetString(subProgram.ProgramData).Contains("SV_InstanceID");
					}
					else
					{
						// If this is not a vertex shader, find the corresponding vertex shader, and check if it uses SV_InstanceID
						foreach (SerializedSubProgram other in enumerator)
						{
							ShaderSubProgram otherProgram = writer.Shader.Blobs[platformPC].SubPrograms[other.BlobIndex];

							HashSet<string> otherKeywords = new HashSet<string>(otherProgram.GlobalKeywords);
							otherKeywords.UnionWith(otherProgram.LocalKeywords);

							if ((other.GpuProgramType == (int)ShaderGpuProgramType.DX11VertexSM40 ||
								 other.GpuProgramType == (int)ShaderGpuProgramType.DX11VertexSM50) &&
								otherKeywords.SetEquals(programKeywords) &&
								Encoding.Default.GetString(otherProgram.ProgramData).Contains("SV_InstanceID"))
							{
								usesInstanceID = true;
								break;
							}
						}
					}

					// If it doesn't, we want to replace it with an equivalent variant, but with the instancing keyword turned off.
					if (!usesInstanceID)
					{
						HashSet<string> desiredKeywords = new HashSet<string>(programKeywords);
						desiredKeywords.Remove("STEREO_INSTANCING_ON");
						foreach (SerializedSubProgram other in enumerator)
						{
							ShaderSubProgram otherProgram = writer.Shader.Blobs[platformPC].SubPrograms[other.BlobIndex];

							HashSet<string> otherKeywords = new HashSet<string>(otherProgram.GlobalKeywords);
							otherKeywords.UnionWith(otherProgram.LocalKeywords);

							// If we find a variant with the desired keyword, that is also the same type, switch to that and carry on.
							if (otherKeywords.SetEquals(desiredKeywords) && other.GpuProgramType == targetProgram.GpuProgramType)
							{
								targetProgram = other;
								break;
							}
						}
					}
				}

				// Only put the macro guard if there are any keywords present
				bool hasVariants = programKeywords.Count > 0 || excludedKeywords.Count > 0;
				if (hasVariants)
				{
					writer.WriteIndent(3);
					writer.Write("#if ");

					if (programKeywords.Count > 0 && excludedKeywords.Count > 0)
					{
						writer.Write($"({string.Join(" && ", programKeywords)}) && !({string.Join(" || ", excludedKeywords)})");
					}
					else if (programKeywords.Count > 0)
					{
						writer.Write($"({string.Join(" && ", programKeywords)})");
					}
					else if (excludedKeywords.Count > 0)
					{
						writer.Write($"!({string.Join(" || ", excludedKeywords)})");
					}

					writer.WriteLine();
				}

				targetProgram.Export(writer, ShaderType.None, false);

				if (hasVariants)
				{
					writer.WriteIndent(3);
					writer.WriteLine("#endif");
				}
			}
			
			writer.WriteIndent(3);
			writer.WriteLine("ENDCG");
		}

		public IReadOnlyDictionary<string, int> NameIndices => m_nameIndices;
		public SerializedPassType Type { get; set; }
		public uint ProgramMask { get; set; }
		public bool HasInstancingVariant { get; set; }
		public string UseName { get; set; }
		public string Name { get; set; }
		public string TextureName { get; set; }

		public SerializedShaderState State;
		public SerializedProgram ProgVertex;
		public SerializedProgram ProgFragment;
		public SerializedProgram ProgGeometry;
		public SerializedProgram ProgHull;
		public SerializedProgram ProgDomain;
		public SerializedProgram ProgRayTracing;
		public SerializedTagMap Tags;

		private Dictionary<string, int> m_nameIndices;
	}
}
