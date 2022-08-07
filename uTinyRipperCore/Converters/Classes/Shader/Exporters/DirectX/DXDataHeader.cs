using System.IO;
using uTinyRipper;
using uTinyRipper.Classes.Shaders;

namespace uTinyRipper.Classes.Converters
{
	public struct DXDataHeader
	{
		/// <summary>
		/// Not D3D9
		/// </summary>
		public static bool HasHeader(GPUPlatform graphicApi) => graphicApi != GPUPlatform.d3d9;
		/// <summary>
		/// 5.4.0 and greater
		/// </summary>
		public static bool HasGSInputPrimitive(Version version) => version.IsGreaterEqual(5, 4);

		public static int GetDataOffset(byte rootSignatureVersion, Version version, GPUPlatform graphicApi)
		{
			if (HasHeader(graphicApi))
			{
				if (rootSignatureVersion == 2)
				{
					return 32 + (HasGSInputPrimitive(version) ? 6 : 5);
				}
				else
				{
					return HasGSInputPrimitive(version) ? 6 : 5;
				}
			}
			else
			{
				return 0;
			}
		}

		public void Read(BinaryReader reader, Version version)
		{
			RootSignatureType = reader.ReadByte();

			if (RootSignatureType == 0)
				return;
			else if (RootSignatureType == 1) // Shader only
			{
				Textures = reader.ReadByte();
				CBs = reader.ReadByte();
				Samplers = reader.ReadByte();
				UAVs = reader.ReadByte();
				if (HasGSInputPrimitive(version))
				{
					GSInputPrimitive = (DXInputPrimitive)reader.ReadByte();
				}
			}
			else if (RootSignatureType == 2)
			{
				Textures = reader.ReadByte();
				CBs = reader.ReadByte();
				Samplers = reader.ReadByte();
				UAVs = reader.ReadByte();
				if (HasGSInputPrimitive(version))
				{
					GSInputPrimitive = (DXInputPrimitive)reader.ReadByte();
				}

				// Padding, 32 bytes
				for (int i = 0; i < 32; i++)
				{
					reader.ReadByte();
				}
			}
		}

		public void Write(BinaryWriter writer, Version version)
		{
			writer.Write(RootSignatureType);
			writer.Write(Textures);
			writer.Write(CBs);
			writer.Write(Samplers);
			writer.Write(UAVs);
			if (HasGSInputPrimitive(version))
			{
				writer.Write((byte)GSInputPrimitive);
			}

			if (RootSignatureType == 2)
			{
				// Padding, 32 bytes
				for (int i = 0; i < 32; i++)
				{
					writer.Write((byte)0);
				}
			}
		}

		public byte RootSignatureType { get; set; }
		public byte Textures { get; set; }
		public byte CBs { get; set; }
		public byte Samplers { get; set; }
		public byte UAVs { get; set; }
		public DXInputPrimitive GSInputPrimitive { get; set; }
	}
}
