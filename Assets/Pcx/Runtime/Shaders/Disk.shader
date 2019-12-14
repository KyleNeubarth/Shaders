Shader "Point Cloud/Disk"
{
    Properties
    {
    	//tint controls the color of the cloud	
	//point size controls the size of the disks
        _Tint("Tint", Color) = (0.5, 0.5, 0.5, 1)
        _PointSize("Point Size", Float) = 0.05
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Cull Off
        Pass
        {
            Tags { "LightMode"="ForwardBase" }
            CGPROGRAM
	    
	    //declare shader functions
            #pragma vertex Vertex
            #pragma geometry Geometry
            #pragma fragment Fragment
	    
            #pragma multi_compile_fog
            #pragma multi_compile _ UNITY_COLORSPACE_GAMMA
            #pragma multi_compile _ _COMPUTE_BUFFER
	    
	    //Vertex, Geometry, and Fragment shaders are included here, check below
            #include "Disk.cginc"
            ENDCG
        }
        Pass
        {
            Tags { "LightMode"="ShadowCaster" }
            CGPROGRAM
	    //declare shader functions
            #pragma vertex Vertex
            #pragma geometry Geometry
            #pragma fragment Fragment
            #pragma multi_compile _ _COMPUTE_BUFFER
            #define PCX_SHADOW_CASTER 1
	    
	    //Vertex, Geometry, and Fragment shaders are included here, check below
            #include "Disk.cginc"
            ENDCG
        }
    }
    CustomEditor "Pcx.DiskMaterialInspector"
}
