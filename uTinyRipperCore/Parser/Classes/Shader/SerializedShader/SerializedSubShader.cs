namespace uTinyRipper.Classes.Shaders
{
	public struct SerializedSubShader : IAssetReadable
	{
		public void Read(AssetReader reader)
		{
			Passes = reader.ReadAssetArray<SerializedPass>();
			Tags.Read(reader);
			LOD = reader.ReadInt32();
		}

		public static SerializedSubShader shader;
		public void Export(ShaderWriter writer)
		{
			shader = this;
			writer.WriteIndent(1);
			writer.Write("SubShader {\n");
			if(LOD != 0)
			{
				writer.WriteIndent(2);
				writer.Write("LOD {0}\n", LOD);
			}
			Tags.Export(writer, 2);
			for (int i = 0; i < Passes.Length; i++)
			{
				Passes[i].Export(writer);
			}
			writer.WriteIndent(1);
			writer.Write("}\n");
		}

		public SerializedPass[] Passes { get; set; }
		public int LOD { get; set; }

		public SerializedTagMap Tags;
	}
}
