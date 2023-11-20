#version 150
layout(triangles) in;

// Three lines will be generated: 6 vertices
layout(line_strip, max_vertices=6) out;

uniform mat4 u_M;
uniform mat4 u_VP;

in vec3 v_Normal[];
in vec3 v_Tangent[];
in vec3 v_Bitangent[];

out vec4 vertex_color;

void main()
{
  const float normal_length = 0.05;

  int i;
  for(i=0; i<gl_in.length(); i++)
  {
    vec3 P = gl_in[i].gl_Position.xyz;
    vec3 N = v_Normal[i];
    
    gl_Position = u_VP * u_M * vec4(P, 1.0);
    vertex_color = vec4(1,1,0,1);
    EmitVertex();
    
    gl_Position = u_VP * u_M * vec4(P + N * normal_length, 1.0);
    vertex_color = vec4(1,1,0,1);
    EmitVertex();
    
    EndPrimitive();
  }
}