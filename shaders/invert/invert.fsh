//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 ogColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 white = vec4(1.0, 1.0, 1.0, ogColor.a);
	vec4 inverted = ogColor;
	inverted.r = white.r - ogColor.r;
	inverted.g = white.g - ogColor.g;
	inverted.b = white.b - ogColor.b;
    gl_FragColor = inverted;
}
