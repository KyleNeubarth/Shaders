Shader "Tutorial/DisplayNormals"
{
	SubShader{

		Pass {
			//We are starting a CG script
			CGPROGRAM
			//has a vertex function named vert
			#pragma vertex vert
			//has a fragment function named frag
			#pragma fragment frag
			//include for useful functions, appbase is a structure used here used here
			#include "UnityCG.cginc"

			//this struct will relay data from the vert shader to the frag shader.
			//here we relay the position of the vertex (common) and a color based on the normal of that vertex
			struct v2f {

				float4 pos : SV_POSITION;
				fixed3 color : COLOR0;

			};
			///appdata is a helpful struct included from UnityCG.cginc which contains all the vertex data we need
			v2f vert(appdata_base v) {
				v2f o;
				//this magical function transforms the vertex data from v into worldspace
				o.pos = UnityObjectToClipPos(v.vertex);
				//transform the normal into a color!
				o.color = v.normal * 0.5 + 0.5;
				return o;
			}
			//not much to do here, just return the color that was relayed
			fixed4 frag(v2f i) : SV_Target{
				return fixed4(i.color,1);
			}

			ENDCG

		}

	}
	//did the subshader fail because my computer is a potato? Then just use this built in shader instead
	Fallback "TexturedColored"
}
