Shader "Custom/PointCloudReconstruction"
{
	Properties
	{
		_Tint("Tint", Color) = (0.5, 0.5, 0.5, 1)
		_PointSize("Point Size", Float) = 0.05
	}

	SubShader{

		pass {

			CGPROGRAM

			//#include "UnityCG.cginc"
			//#include "Common.cginc"

			struct vInput {
				float4 position : POSITION;
				half3 color : COLOR;
			}

			struct fInput {
				
				float2 uv : TEXCOORD0;
				float4 position : SV_POSITION;
			
			}

			#pragma vertex Vertex
			//#pragma geometry Geometry
			#pragma fragment Fragment

			fInput Vertex(vInput input)
			{
				float4 pos = input.position;
				half3 col = input.color;

				fInput f;
				f.position = UnityObjectToClipPos(pos);

				return f;
			}

			half4 Fragment(fInput input) : SV_Target
			{
				return half4(input.uv,0,0);
			}

			ENDCG
		}
	}
    FallBack "Diffuse"
}
