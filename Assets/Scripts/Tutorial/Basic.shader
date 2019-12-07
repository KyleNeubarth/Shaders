Shader "Tutorial/Basic" {
	Properties{
		_Color("Main Color", Color) = (1,0.5,0.5,1)
	}
		SubShader{
			Pass {
				Material {
					//Just uses the default diffuse material, not much of a
					Diffuse[_Color]
				}
				Lighting On
			}
	}
}