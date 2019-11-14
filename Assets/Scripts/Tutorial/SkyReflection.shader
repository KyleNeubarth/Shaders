Shader "Unlit/SkyReflection"
{
	SubShader
	{
		Pass 
		{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			struct fInput {

				half3 ref : TEXCOORD0;
				float4 pos : POSITION;
			
			}
			
			fInput vertex(float4 vertex : POSITION, float3 normal : NORMAL)
			{
				fInput o;

				o.pos = UnityObjectToClipPos(vertex);
			}
			
			fixed4 frag(fInput i) : SV_Target
			{
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.POSITION);
				rn col;
		}
			
			ENDCG
		}
	}
}
