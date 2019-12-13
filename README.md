## Shaders
A short exploration of shaders in Unity3D through CU Boulder's Independent Study program.

The Unity project itself is a small VR space where the user can teleport around and view the various shaders discussed below. The contents of this page will consist of a brief demonstration and explanation of each of the shader I have made during this study.
This page will consist of a light tutorial involving Unity shader mechanics as I move through each of the shader programs I have studied. This will hopefully give an idea of the 

Some of the later shaders are derivative of existing projects, which will be cited below.

## Contents

## Shaders 

#Foreword

yo this is the foreword

# Basic Shader

This is what a shader is all about

shader works like this

```c#
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
```
