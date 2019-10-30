Shader "Tutorial/DisplayNormals"
{
	SubShader{

		Pass {

			CGPROGRAM
			//has a vertex function named vert
			#pragma vertex vert
			//has a fragment function named frag
			#pragma fragment frag
			//include for useful functions, appbase is used here
			#include "UnityCG.cginc"

			struct v2f {

				float4 pos : SV_POSITION;
				fixed3 color : COLOR0;

			};

			v2f vert(appdata_base v) {
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.color = v.normal * 0.5 + 0.5;
				return o;
			}

			fixed4 frag(v2f i) : SV_Target{
				return fixed4(i.color,1);
			}

			ENDCG

		}

	}
	Fallback "TexturedColored"
}
