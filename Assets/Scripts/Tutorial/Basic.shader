//This decleares a shader with said title. 
//The title doesn't need to match the name of the script, and can by found in the unity shaders hirearchy under the path used
Shader "Tutorial/Basic" {
	//The properties block contains all variables that can be changed in the editor
	//They must have a name (_Color), an editor display name ("Main Color"), a type (Color) and an initial value
	Properties{
		_Color("Main Color", Color) = (1,0.5,0.5,1)
	}
	//a shader can contain multiple subshaders, which are primarily meant for different GPU types, but we won't woory about this here
	SubShader{
		//a pass is a single exectuion of code on the object, multiple passes can be used for different effects
		Pass {
			//This section isn't important for us now, it just sets the premade material with the premade shader
			Material {
				//This references our variable, color! note how variables always have an underscore before them
				Diffuse[_Color]
			}
			Lighting On
		}
	}
}
