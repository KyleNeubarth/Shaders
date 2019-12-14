Shader "Tutorial/DisplayUV"
{
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			struct v2f {
				float2 uv : TEXCOORD0;
				float4 pos : SV_POSITION;
			};
			//Here we won't use the appdata struct because we need the UV coordinates
			//v represents the position of the vertex, and uv the UV of the vertex
			//both use the required semantics!
			v2f vert( float4 v : POSITION, uv : TEXCOORD0)
			{
				v2f o;
				//this magical function transforms the vertex data from v into worldspace
				o.pos = UnityObjectToClipPos(v);
				//no math here, the uv can be directly read as a color!
				o.uv = uv;
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				return fixed4(i.uv, 0, 0);
			}
			ENDCG
		}
	}
	//did the subshader fail because my computer is a potato? Then just use this built in shader instead
	Fallback "TexturedColored"
}
