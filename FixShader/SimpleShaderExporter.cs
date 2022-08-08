using System;
using System.Collections.Generic;
using System.Linq;
using uTinyRipper;
using uTinyRipper.Classes;
using uTinyRipper.Classes.Converters;

namespace FixShader
{
	internal static class SimpleShaderExporter
	{
		public static void ExportShaders(string bundlePath, string outPath) => ExportShaders(bundlePath, outPath, (_) => true);

		public static void ExportShaders(string bundlePath, string outPath, Func<Shader, bool> filter)
		{
			GameStructure gs = GameStructure.Load(new List<string>() { bundlePath });
			var assets = gs.FileCollection.FetchAssets();
			var shaders = assets.Where(x => x is Shader).Select(x => (Shader)x).ToList();
			var container = new SimpleExportContainer();
			var exporter = new ShaderAssetExporter();

			foreach (var shader in shaders)
			{
				if (filter(shader))
					exporter.Export(container, shader, outPath + $"{shader.ValidName.Replace("\\", "_").Replace("/", "_")}.shader");
			}
		}
	}
}
