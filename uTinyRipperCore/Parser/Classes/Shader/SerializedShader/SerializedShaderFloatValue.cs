using System;

namespace uTinyRipper.Classes.Shaders
{
	public struct SerializedShaderFloatValue : IAssetReadable
	{
		public void Read(AssetReader reader)
		{
			Val = reader.ReadSingle();
			Name = reader.ReadString();
		}

		public bool IsZero => Val == 0.0f;
		public bool IsMax => Val == 255.0f;

		public float Val { get; set; }
		public string Name { get; set; }

		public string GetPropertyOrValue<T>()
		{
			if (string.IsNullOrEmpty(Name) || Name == "<noninit>")
			{
				if (typeof(T).IsEnum)
					return ((T)Convert.ChangeType(Val, typeof(int))).ToString();
				else
					return ((T)Convert.ChangeType(Val, typeof(T))).ToString();
			}
			else
			{
				return $"[{Name}]";
			}
		}
	}
}
