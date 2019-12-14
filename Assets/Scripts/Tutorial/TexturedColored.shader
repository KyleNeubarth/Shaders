Shader "Tutorial/Textured Colored" {
	Properties{
		//two user inputs, defined and initialized
		_Color("Main Color", Color) = (1,1,1,0.5)
		_MainTex("Texture", 2D) = "white" { }
	}
		SubShader{
			Pass {

			CGPROGRAM
			//define shader functions
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"
			
			//instantiate user inputs in the shader code
			fixed4 _Color;
			sampler2D _MainTex;

			struct v2f {
				float4 pos : SV_POSITION;
				float2 uv : TEXCOORD0;
			};
			//appdata base is a struct included in UnityCG, used as input for vertex shader
			v2f vert(appdata_base v)
			{
				v2f o;
				//translates position into world space
				o.pos = UnityObjectToClipPos(v.vertex);
				//transforms texture coords into coords on the object itself
				o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				//get the color from the texture, then multiply it by our input color
				fixed4 texcol = tex2D(_MainTex, i.uv);
				return texcol * _Color;
			}
			ENDCG

		}
	}
}
