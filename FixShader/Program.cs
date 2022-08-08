using uTinyRipper;
using uTinyRipper.Classes;
using uTinyRipper.Converters;
using uTinyRipper.Layout;
using uTinyRipper.Project;
using uTinyRipper.SerializedFiles;
using uTinyRipper.Classes.Converters;
using Version = uTinyRipper.Version;
using System.Collections.Generic;
using System;
using System.Linq;
using System.IO;
using uTinyRipper.Classes.Shaders;

namespace FixShader
{
	public class Program
	{
		public static void CreateAndClearDirectory(string path)
		{
			if (Directory.Exists(path))
			{
				foreach (var file in Directory.GetFiles(path))
				{
					File.Delete(file);
				}
			}
			else
			{
				Directory.CreateDirectory(path);
			}
		}

		public static void Main()
		{
			string bundlePath = @"C:\Users\Pema Malling\AppData\LocalLow\VRChat\VRChat\Avatars\Strawberry Tumu (6).vrca";
			string shaderBundlerPath = @"D:\Projects\UtinyRipper-master\ShaderBundleBuilder\";
			string unityPath = @"C:\Program Files\2019.4.31f1\Editor\Unity.exe";
			string outPath = shaderBundlerPath + "Assets/BundledAssets/shaderbundle/";
			string variantsPath = shaderBundlerPath + "Assets/Variants/";

			//"C:\Program Files\2019.4.31f1\Editor\Unity.exe" -batchmode -projectPath "D:\Projects\UtinyRipper-master\ShaderBundleBuilder" -executeMethod BuildBundle.BuildAllAssetBundles

			// Step 0: Setup up folders
			CreateAndClearDirectory(outPath);
			CreateAndClearDirectory(variantsPath);

			// Step 1: Export shaders to .shader files
			var exported = SimpleShaderExporter.ExportShaders(bundlePath, outPath, shader =>
			{
				if (shader.ValidName.StartsWith("Legacy Shaders/")) return false;
				if (shader.ValidName.StartsWith("Hidden/")) return false;
				if (shader.ValidName == "Standard") return false;
				return true;
			});

			// Step 2: Take note of variants used
			foreach (var shader in exported)
			{
				var variants = new List<string>();
				foreach (var subProgram in shader.Blobs[shader.Platforms.IndexOf(GPUPlatform.d3d11)].SubPrograms)
				{
					var keywords = subProgram.GlobalKeywords.Union(subProgram.LocalKeywords ?? Array.Empty<string>());
					string variant = string.Join(",", keywords);
					if (variant != "")
						variants.Add(variant);
				}
				File.WriteAllLines(variantsPath + SimpleShaderExporter.EscapedShaderName(shader) + ".variants", variants.Distinct());
			}

			// Step 3: Build bundle containing just .shader files
			var proc = System.Diagnostics.Process.Start(unityPath,
				$"-batchmode -projectPath \"{shaderBundlerPath}\" -executeMethod BuildBundle.BuildAllAssetBundles -quit");
			proc.WaitForExit();

			// Step 4: Replace shaders in the original bundle with shaders from built bundle

		}
	}
}