using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using uTinyRipper;
using uTinyRipper.Classes;
using uTinyRipper.Classes.Converters;

namespace FixShader
{
	internal static class SimpleShaderExporter
	{
		public static IEnumerable<Shader> ExportShaders(string bundlePath, string outPath, bool debug = false) => ExportShaders(bundlePath, outPath, (_) => true, debug);

		public static IEnumerable<Shader> ExportShaders(string bundlePath, string outPath, Func<Shader, bool> filter, bool debug = false)
		{
			GameStructure gs = GameStructure.Load(new List<string>() { bundlePath });
			var assets = gs.FileCollection.FetchAssets();
			var shaders = assets.Where(x => x is Shader).Select(x => (Shader)x).ToList();
			var container = new SimpleExportContainer();
			var exporter = new ShaderAssetExporter();

			var exported = new ConcurrentBag<Shader>();

			int progress = 0;
			Parallel.For(0, shaders.Count, i =>
			{
				var shader = shaders[i];
				if (filter(shader))
				{
					if (exporter.Export(container, shader, outPath + EscapedShaderName(shader) + ".shader"))
					{
						exported.Add(shader);
					}
				}

				if (debug)
				{
					Console.WriteLine($"Exported {progress + 1}/{shaders.Count} shaders...");
					Interlocked.Increment(ref progress);
				}
			});

			return exported;
		}

		public static string EscapedShaderName(Shader shader)
		{
			return shader.ValidName.Replace("\\", "_").Replace("/", "_");
		}
	}
}
