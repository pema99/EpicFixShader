using DXShaderRestorer;
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

		public static string binaryPath = "";

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
						/*WrappedGlExtensions ext = new WrappedGlExtensions();
						ext.ARB_explicit_attrib_location = 1;
						ext.ARB_explicit_uniform_location = 1;
						ext.ARB_shading_language_420pack = 0;
						ext.OVR_multiview = 0;
						ext.EXT_shader_framebuffer_fetch = 0;*/
						//try
						{
							string shadern = SerializedShader.shader.Name;
							string subshader = string.Join("_", SerializedSubShader.shader.Tags.Tags.Select(x => x.Key + "-" + x.Value).ToList());
							string shadertype = System.Enum.GetName(typeof(uTinyRipper.Classes.Shaders.ShaderType), SerializedProgram.shader);
							string subprogram = ""+SerializedSubProgram.shader.BlobIndex;
							string name = $"{shadern}_{shadertype}_{subshader}_{subprogram}".Replace('/', '$');
							File.WriteAllBytes(binaryPath + $"{name}.dxbc", exportData);
							/*Shader shader = Shader.TranslateFromMem(exportData, WrappedGLLang.LANG_DEFAULT, ext);
							if (shader.OK == 0)
							{
								base.Export(writer, ref subProgram);
							}
							else
							{
								ExportListing(writer, shader.Text);
							}*/
						}
						//catch(System.Exception e) { }
					}
				}
			}
		}
	}
}
