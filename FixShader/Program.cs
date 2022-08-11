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
using AssetsTools.NET.Extra;
using AssetsTools.NET;

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
			string bundlePath = @"C:\Users\Pema Malling\Downloads\World-Fractal-Explorer-2-v8-Asse.file_56d180cd-00ea-4475-8a72-9533274266a8.177.vrcw";
			string shaderBundlerPath = @"D:\Projects\UtinyRipper-master\ShaderBundleBuilder\";
			string unity2019Path = @"C:\Program Files\2019.4.31f1\Editor\Unity.exe";
			string unity2018Path = @"C:\Program Files\2018.4.20f1\Editor\Unity.exe";
			string unity2017Path = @"C:\Program Files\2017.4.40f1\Editor\Unity.exe";
			string outPath = shaderBundlerPath + "Assets/BundledAssets/shaderbundle/";
			string variantsPath = shaderBundlerPath + "Assets/Variants/";

			// Step 0: Setup folders
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

					// We force the instancing keyword to be present during export, so we need to make
					// sure to include the new variants created from doing so. This is like adding a new keyword.
					if (!keywords.Contains("STEREO_INSTANCING_ON"))
					{
						var keywordsInstancing = keywords.Union(new string[] { "STEREO_INSTANCING_ON" });
						variants.Add(string.Join(",", keywordsInstancing));
					}
				}
				File.WriteAllLines(variantsPath + SimpleShaderExporter.EscapedShaderName(shader) + ".variants", variants.Distinct());
			}

			// Step 3: Build bundle containing just .shader files, use editor appropriate for bundle
			var am = new AssetsManager();
			var bunDst = am.LoadBundleFile(bundlePath);
			var assetsDst = am.LoadAssetsFileFromBundle(bunDst, 0, false);

			string editorVersion = assetsDst.file.typeTree.unityVersion;
			string editorPath = unity2017Path;
			if (editorVersion.StartsWith("2019"))
				editorPath = unity2019Path;
			else if (editorVersion.StartsWith("2018"))
				editorPath = unity2018Path;

			var proc = System.Diagnostics.Process.Start(editorPath,
				$"-batchmode -projectPath \"{shaderBundlerPath}\" -executeMethod BuildBundle.BuildAllAssetBundles -quit");
			proc.WaitForExit();

			// Step 4: Replace shaders in the original bundle with shaders from built bundle
			{
				// Get source asset data
				var bunSrc = am.LoadBundleFile(shaderBundlerPath + "Assets/StreamingAssets/shaderbundle");
				var assetsSrc = am.LoadAssetsFileFromBundle(bunSrc, 0, false);

				// Load destination asset bundle, replace
				var replacers = new List<AssetsReplacer>();
				foreach (var shaderInfoSrc in assetsSrc.table.GetAssetsOfType((int)AssetClassID.Shader))
				{
					var shaderSrc = am.GetTypeInstance(assetsSrc, shaderInfoSrc).GetBaseField();
					var nameSrc = shaderSrc.Get("m_ParsedForm").Get("m_Name").GetValue().AsString();

					foreach (var shaderInfoDst in assetsDst.table.GetAssetsOfType((int)AssetClassID.Shader))
					{
						var shaderDst = am.GetTypeInstance(assetsDst, shaderInfoDst).GetBaseField();
						var nameDst = shaderDst.Get("m_ParsedForm").Get("m_Name").GetValue().AsString();

						if (nameSrc == nameDst)
						{
							var shaderBytesSrc = shaderSrc.WriteToByteArray();
							var repl = new AssetsReplacerFromMemory(0, shaderInfoDst.index, (int)shaderInfoDst.curFileType, 0xffff, shaderBytesSrc);
							replacers.Add(repl);
						}
					}
				}

				byte[] newAssetData;
				using (var stream = new MemoryStream())
				using (var writer = new AssetsFileWriter(stream))
				{
					assetsDst.file.Write(writer, 0, replacers, 0);
					newAssetData = stream.ToArray();
				}

				// Replace primary asset file in destination bundle
				var bunRepl = new BundleReplacerFromMemory(assetsDst.name, assetsDst.name, true, newAssetData, -1);
				var bunWriter = new AssetsFileWriter(File.OpenWrite(bundlePath + ".new"));
				bunDst.file.Write(bunWriter, new List<BundleReplacer>() { bunRepl });
			}
		}
	}
}