using AssetsTools.NET;
using AssetsTools.NET.Extra;
using System.Collections.Generic;
using System.IO;

public class Program
{
	public static void Main()
	{
		var am = new AssetsManager();

		// Get source asset data
		var bunSrc = am.LoadBundleFile(@"C:\Users\Pema Malling\AppData\LocalLow\VRChat\VRChat\Avatars\OLD.vrca");
		var assetsSrc = am.LoadAssetsFileFromBundle(bunSrc, 0, false);
		var shadersSrc = assetsSrc.table.GetAssetsOfType((int)AssetClassID.Shader)[0];
		var baseFieldSrc = am.GetTypeInstance(assetsSrc, shadersSrc).GetBaseField();
		var shaderBytesSrc = baseFieldSrc.WriteToByteArray();

		// Load destination asset bundle, replace
		var bunDst = am.LoadBundleFile(@"C:\Users\Pema Malling\AppData\LocalLow\VRChat\VRChat\Avatars\NEW.vrca");
		var assetsDst = am.LoadAssetsFileFromBundle(bunDst, 0, false);
		var shadersDst = assetsDst.table.GetAssetsOfType((int)AssetClassID.Shader)[0];

		// Replace shader in destination bundle with source shader
		var repl = new AssetsReplacerFromMemory(0, shadersDst.index, (int)shadersDst.curFileType, 0xffff, shaderBytesSrc);

		// Read out new asset file data
		byte[] newAssetData;
		using (var stream = new MemoryStream())
		using (var writer = new AssetsFileWriter(stream))
		{
			assetsDst.file.Write(writer, 0, new List<AssetsReplacer>() { repl }, 0);
			newAssetData = stream.ToArray();
		}

		// Replace primary asset file in destination bundle
		var bunRepl = new BundleReplacerFromMemory(assetsDst.name, assetsDst.name, true, newAssetData, -1);
		var bunWriter = new AssetsFileWriter(File.OpenWrite(@"C:\Users\Pema Malling\AppData\LocalLow\VRChat\VRChat\Avatars\NEW.vrca"));
		bunDst.file.Write(bunWriter, new List<BundleReplacer>() { bunRepl });
	}
}