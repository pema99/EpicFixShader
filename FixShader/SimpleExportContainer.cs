using System;
using System.Collections.Generic;
using uTinyRipper;
using uTinyRipper.Classes;
using uTinyRipper.Converters;
using uTinyRipper.Layout;
using uTinyRipper.Project;
using uTinyRipper.SerializedFiles;
using Version = uTinyRipper.Version;

namespace FixShader
{
	internal class SimpleExportContainer : IExportContainer
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
}
