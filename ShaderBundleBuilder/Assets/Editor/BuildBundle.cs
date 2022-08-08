using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
using System;
using System.Reflection;
using System.Linq;

public class BuildBundle : MonoBehaviour
{
    static string EscapedShaderName(Shader shader)
    {
        return shader.name.Replace("\\", "_").Replace("/", "_");
    }

    static string[] GetAllKeywords(Shader shader)
    {
        var globals = (string[])typeof(ShaderUtil)
            .GetMethod("GetShaderGlobalKeywords", BindingFlags.Static | BindingFlags.NonPublic)
            .Invoke(null, new object[] { shader });
        var locals = (string[])typeof(ShaderUtil)
            .GetMethod("GetShaderLocalKeywords", BindingFlags.Static | BindingFlags.NonPublic)
            .Invoke(null, new object[] { shader });

        if (locals != null)
        {
            return globals.Union(locals).ToArray();
        }

        return globals;
    }

    [MenuItem("Assets/Build AssetBundles")]
    public static void BuildAllAssetBundles()
    {
        string assetBundleDirectory = "Assets/StreamingAssets";
        if (!Directory.Exists(Application.streamingAssetsPath))
        {
            Directory.CreateDirectory(assetBundleDirectory);
        }

        string bundleDirectory = "BundledAssets/shaderbundle";
        var shaders = new List<Shader>();
        foreach (string file in Directory.GetFiles(Path.Combine(Application.dataPath, bundleDirectory)))
        {
            string shortPath = Path.Combine("Assets", bundleDirectory, Path.GetFileName(file));
            var importer = AssetImporter.GetAtPath(shortPath);
            if (importer is ShaderImporter shaderImporter)
            {
                shaderImporter.assetBundleName = "shaderbundle";
                shaders.Add(AssetDatabase.LoadAssetAtPath<Shader>(shortPath));
            }
        }

        string variantsPath = @"C:\Users\Pema Malling\AppData\LocalLow\VRChat\VRChat\Avatars\scratch\";
        var svc = new ShaderVariantCollection();
        foreach (var shader in shaders)
        {
            string[] variants = File.ReadAllLines(Path.Combine(variantsPath, EscapedShaderName(shader) + ".variants"));
            foreach (PassType pt in Enum.GetValues(typeof(PassType)))
            {
                foreach (var variant in variants)
                {
                    string[] keywords = variant.Split(',');
                    try
                    {
                        svc.Add(new ShaderVariantCollection.ShaderVariant(shader, pt, keywords));
                    }
                    catch (System.Exception _) {}
                }
            }
        }
        
        string svcPath = Path.Combine("Assets", bundleDirectory, "svc.shadervariants");
        FileUtil.DeleteFileOrDirectory(svcPath);
        AssetDatabase.CreateAsset(svc, svcPath);
        AssetImporter.GetAtPath(svcPath).assetBundleName = "shaderbundle";

        BuildPipeline.BuildAssetBundles(assetBundleDirectory, BuildAssetBundleOptions.None, EditorUserBuildSettings.activeBuildTarget);
    }
}
