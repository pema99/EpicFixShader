using uTinyRipper;
using uTinyRipper.Classes;
using uTinyRipper.Classes.Shaders;
using uTinyRipper.Converters;
using uTinyRipper.Converters.Shaders;
using uTinyRipper.Layout;
using uTinyRipper.Project;
using uTinyRipper.SerializedFiles;
using uTinyRipperGUI.Exporters;
using Version = uTinyRipper.Version;

public class Program
{
	public static void Main() => new Program().Start();

	public class SimpleExportContainer : IExportContainer
	{
		private Version version;
		private AssetLayout exportLayout;

		public SimpleExportContainer()
		{
			this.version = new Version(2019, 3, 31, VersionType.Final, 1);
			ExportOptions options = new ExportOptions(version, Platform.NoTarget, TransferInstructionFlags.NoTransferInstructionFlags);
			exportLayout = new AssetLayout(new LayoutInfo(options.Version, options.Platform, options.Flags));
		}

		public IExportCollection CurrentCollection => throw new NotImplementedException();

		public AssetLayout ExportLayout => exportLayout;

		public uTinyRipper.Version ExportVersion => throw new NotImplementedException();

		public Platform ExportPlatform => throw new NotImplementedException();

		public TransferInstructionFlags ExportFlags => throw new NotImplementedException();

		public string Name => throw new NotImplementedException();

		public AssetLayout Layout => throw new NotImplementedException();

		public uTinyRipper.Version Version => version;

		public Platform Platform => throw new NotImplementedException();

		public TransferInstructionFlags Flags => throw new NotImplementedException();

		public IReadOnlyList<FileIdentifier> Dependencies => throw new NotImplementedException();

		public MetaPtr CreateExportPointer(uTinyRipper.Classes.Object asset)
		{
			throw new NotImplementedException();
		}

		public uTinyRipper.Classes.Object FindAsset(int fileIndex, long pathID)
		{
			throw new NotImplementedException();
		}

		public uTinyRipper.Classes.Object FindAsset(ClassIDType classID)
		{
			throw new NotImplementedException();
		}

		public uTinyRipper.Classes.Object FindAsset(ClassIDType classID, string name)
		{
			throw new NotImplementedException();
		}

		public uTinyRipper.Classes.Object GetAsset(long pathID)
		{
			throw new NotImplementedException();
		}

		public uTinyRipper.Classes.Object GetAsset(int fileIndex, long pathID)
		{
			throw new NotImplementedException();
		}

		public ClassIDType GetAssetType(long pathID)
		{
			throw new NotImplementedException();
		}

		public long GetExportID(uTinyRipper.Classes.Object asset)
		{
			return ExportCollection.GetMainExportID(asset);
		}

		public bool IsSceneDuplicate(int sceneID)
		{
			throw new NotImplementedException();
		}

		public string SceneIndexToName(int sceneID)
		{
			throw new NotImplementedException();
		}

		public string TagIDToName(int tagID)
		{
			throw new NotImplementedException();
		}

		public ushort TagNameToID(string tagName)
		{
			throw new NotImplementedException();
		}

		public AssetType ToExportType(ClassIDType classID)
		{
			throw new NotImplementedException();
		}
	}

	// Configure these :)
	public static readonly string bundlePath = @"C:\Users\Pema Malling\AppData\LocalLow\VRChat\VRChat\Avatars\Strawberry Tumu (6).vrca";
	public static readonly string outputPath = @"C:\Users\Pema Malling\AppData\LocalLow\VRChat\VRChat\Avatars\";

	public void Start()
	{
		GameStructure gs = GameStructure.Load(new List<string>() { bundlePath });
		var assets = gs.FileCollection.FetchAssets();
		var shaders = assets.Where(x => x is Shader).Select(x => (Shader)x).ToList();
		var container = new SimpleExportContainer();
		var exporter = new ShaderAssetExporter();

		if (!Directory.Exists(outputPath + @"shaders\"))
			Directory.CreateDirectory(outputPath + @"shaders\");
		if (!Directory.Exists(outputPath + @"binaries\"))
			Directory.CreateDirectory(outputPath + @"binaries\");

		ShaderHLSLccExporter.binaryPath = outputPath + @"binaries\";

		foreach (var shader in shaders)
		{
			//shader.Blobs[0].SubPrograms[0].;
			exporter.Export(container, shader, outputPath + $@"shaders\{shader.ValidName.GetHashCode()}.shader");
			Console.WriteLine(shader.ValidName);
		}
	}
}