using DXShaderRestorer;
using System;
//using HLSLccWrapper;
using System.IO;
using System.Linq;
using uTinyRipper;
using uTinyRipper.Classes.Shaders;

namespace uTinyRipper.Classes.Converters
{
	public class ShaderHLSLccExporter : ShaderDXExporter
	{
		public ShaderHLSLccExporter(GPUPlatform graphicApi):
			base(graphicApi)
		{
		}

		private static readonly Version currentVersion = new Version(2019, 4, 31, VersionType.Final, 1);

		public override void Export(ShaderWriter writer, ref ShaderSubProgram subProgram)
		{
			using (MemoryStream stream = new MemoryStream(subProgram.ProgramData))
			{
				using (BinaryReader reader = new BinaryReader(stream))
				{
					DXDataHeader header = new DXDataHeader();
					header.Read(reader, writer.Version);

					// HACK: since we can't restore UAV info and HLSLcc requires it, process such shader with default exporter
					if (header.UAVs > 0)
					{
						base.Export(writer, ref subProgram);
					}
					else
					{
						byte[] exportData = DXShaderProgramRestorer.RestoreProgramData(reader, writer.Version, ref subProgram);
						/*string shadern = SerializedShader.shader.Name;
						string subshader = string.Join("_", SerializedSubShader.shader.Tags.Tags.Select(x => x.Key + "-" + x.Value).ToList());
						string shadertype = System.Enum.GetName(typeof(uTinyRipper.Classes.Shaders.ShaderType), SerializedProgram.shader);
						string subprogram = "" + SerializedSubProgram.shader.BlobIndex;
						string name = $"{shadern}_{shadertype}_{subshader}_{subprogram}".Replace('/', '$');
						File.WriteAllBytes(binaryPath + $"{name}.dxbc", exportData);*/

						// TODO(pema): We're skipping tess and geom for now since they are complicated and keep crashing HLSLcc.
						string shaderText = "// UNSUPPORTED SHADER TYPE!";
						var type = subProgram.GetProgramType(currentVersion);
						if (type != ShaderGpuProgramType.DX11GeometrySM40 && type != ShaderGpuProgramType.DX11GeometrySM50 &&
							type != ShaderGpuProgramType.DX11DomainSM50 && type != ShaderGpuProgramType.DX11HullSM50)
						{
							shaderText = HLSLccWrapper.TranslateHLSL(exportData, GLLang.LANG_HLSL);
						}

						// TODO(merlin): Handle error
						//base.Export(writer, ref subProgram);
						ExportListing(writer, shaderText);
					}
				}
			}
		}
	}
}
