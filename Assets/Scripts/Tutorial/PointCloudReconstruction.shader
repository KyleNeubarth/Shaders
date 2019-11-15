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

			#include "UnityCG.cginc"
			//#include "Common.cginc"

			//vInput will just be an appdata struct

			struct gInput {
				float4 position : POSITION;
				half3 color : COLOR;
			};

			struct fInput {
				
				float2 uv : TEXCOORD0;
				float4 position : SV_POSITION;
			
			};

			#pragma vertex Vertex
			#pragma geometry Geometry
			#pragma fragment Fragment

			//appdata full contains pos, normal, tan, vert color, two texture coords(?)
			gInput Vertex(appdata_full input)
			{
				gInput o;
				o.vertex = v.vertex;
				o.normal = v.normal;
				o.color = v.color;
				return o;
			}
			//how many vertices max should come out of this pass of the shader?
			[maxvertexcount(12)]
			//input is v2g for each triangle in the mesh, so arrays of 3 verts
			//output is our trianglestream of frag inputs
			void Geometry(triangle gInput input[3], inout TriangleStream<fInput> tristream)
			{
				
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
