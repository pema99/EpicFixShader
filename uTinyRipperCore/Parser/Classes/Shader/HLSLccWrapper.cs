using System;
using System.Runtime.InteropServices;

namespace uTinyRipper.Classes.Shaders
{
	public enum GLLang
	{
		LANG_DEFAULT,// Depends on the HLSL shader model.
		LANG_ES_100, LANG_ES_FIRST = LANG_ES_100,
		LANG_ES_300,
		LANG_ES_310, LANG_ES_LAST = LANG_ES_310,
		LANG_120, LANG_GL_FIRST = LANG_120,
		LANG_130,
		LANG_140,
		LANG_150,
		LANG_330,
		LANG_400,
		LANG_410,
		LANG_420,
		LANG_430,
		LANG_440, LANG_GL_LAST = LANG_440,
		LANG_METAL,
		LANG_HLSL, // TODO(pema): All the LANG_<number> variants are used to determine the feature set of GLSL. Some of these should probably be fixed up with HLSL equivalent.
	}
	
	public static class HLSLccWrapper
	{
		[DllImport("Libraries/x64/hlslcc.dll")]
		private static extern int TranslateHLSLFromMemSourceOnly(byte[] bytecode, GLLang lang, ref IntPtr strData);

		[DllImport("Libraries/x64/hlslcc.dll")]
		private static extern int FreeString(IntPtr strPtr);

		public static string TranslateHLSL(byte[] bytecode, GLLang lang)
		{
			IntPtr strPtr = IntPtr.Zero;

			TranslateHLSLFromMemSourceOnly(bytecode, lang, ref strPtr);

			string result = Marshal.PtrToStringAnsi(strPtr);

			FreeString(strPtr);

			return result;
		}
	}
}