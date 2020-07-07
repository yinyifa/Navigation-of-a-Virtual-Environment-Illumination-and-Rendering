|Courese/term|Project|Full Name|IU Username|
|------------------|------|-----------|---------|
|B581 / Spring 2020|Final Project|Yifan, Yin | yinyifa|

### The Unity environment you used for the Final Project (i.e. a list of all C# Unity scripts and shader source code files included in the Final Project, the version of Unity you used, any particular assets, etc.).

cm.cs

InputMethod.cs

lightMove.cs

moveCamera.cs

objectMove.cs

om.cs

om2.cs

om3.cs

om4.cs

showEvent.cs

switchCamera.cs

Texture.shader

SplineShader.shader

version of unity:2019.2.14f


### The parts of the coding assignment that you completed.

I finished All parts. (including Optional Tasks)

### (optional) Anything you are proud of in the code and want us to notice.

1. add a tree, the branch material using my own shader

2. every object can adjust speed

3. add summary section to show mouse/keyboard event for operation keys.

4. flying mode (free move camera)

5. earth-solar system use texture mapping

### Written Part:

D. Computing Normals to Polyhedron Faces (for use in Illumination Equations).

	1. [(x2 - x1) x (x3-x2)] = ((y2 - y1) * (z3 - z2) - (z2 - z1) (y3 - y2), (z2 -z1) * (x3 - x2) - (x2 - x1) * (z3 -z2), (x2 - x1) * (y3 -y2) - (z2 - z1) * (x3 - x2))

	2. [(x2 - x1) x (x3 - x2)], [(x3 - x2) x (x1 - x3)], [(x1 - x3) x (x2 - x1)]
		[(x3 - x2) x (x2 - x1)], [(x2 - x1) x (x1 - x3)], [(x1 - x3) x (x3 - x2)]

E. Texture Mapping
	
	1. vertices: A(0 , 0), B(-2, 2), C(-2, 4), D(0, 6), E(2, 4), F(2, 2)
		triangles: one(A, F, E), two(A, E, D), three(A, D, C), for(A, C, B)

	2. o.uv = v.texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;

	   this code is from my vertex shader, and it will transfer the texture's coordinates to vertex coordinates. Then the texture will perfectly mapping the hexagonal. 

	3. Just assign the appropriate texture coordinates to the vertices of the face
	   Texture coordinates specify where color values ​​should be obtained from texture space. 
	   Interpolate texture coordinates between vertices

	4. Just assign the appropriate texture coordinates to the vertices of the face
	   Texture coordinates specify where color values ​​should be obtained from texture space. 

	5. 	MIPmapping can apply to multiple resolutions. can fix the moire pattern. add a pre-filtered process.

F. Bump Mapping
	
	1. no. it will compute the new normal and use this new normal to compute illumination.

	2. the height map stores the intensity of the model to present the height of the surface. use with normal mapping for illumination. float 0 to 1

	3. the normal map stores the surface narml direction. use with height map to compute illumination. fixed4

	4. tangent space sotores the vertex's normal, every vertex has its own tangent space. the origin is vertex. tangent is x-axis, normal is z-axis. Binormal is the cross product of tangent and normal (y-axis). tangent.w determine binormal direction

	5.
	suppose height map object is T, and Normal map is G
	for loop 
		Vector3 side1 = T.v1 - T.v0;
    	Vector3 side2 = T.v2 - T.v1;
    	Vector3 normal = Cross(side1, side2);
    	G += normal