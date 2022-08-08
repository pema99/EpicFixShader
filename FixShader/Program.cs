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

namespace FixShader
{
	public class Program
	{
		public static void Main()
		{
			string bundlePath = @"C:\Users\Pema Malling\Downloads\World-Shader-World-v1-Asset-bund.file_c497e839-81d0-4ff7-8cac-b83344ab3280.41.vrcw";
			string outPath = @"C:\Users\Pema Malling\AppData\LocalLow\VRChat\VRChat\Avatars\shaders\";
			string scratchPath = @"C:\Users\Pema Malling\AppData\LocalLow\VRChat\VRChat\Avatars\scratch\";

			// Step 0: Setup up folders
			if (Directory.Exists(outPath))
			{
				foreach (var file in Directory.GetFiles(outPath))
				{
					File.Delete(file);
				}
			}
			else
			{
				Directory.CreateDirectory(outPath);
			}

			Directory.CreateDirectory(scratchPath);

			// Step 1: Export shaders to .shader files
			var exported = SimpleShaderExporter.ExportShaders(bundlePath, outPath, shader =>
			{
				if (shader.ValidName.StartsWith("Legacy Shaders/")) return false;
				if (shader.ValidName.StartsWith("Hidden/")) return false;
				if (shader.ValidName == "Standard") return false;
				return true;
			});

			// Step 2: Build bundle containing just .shader files

			// Step 3: Replace shaders in the original bundle with shaders from built bundle

		}
	}
}