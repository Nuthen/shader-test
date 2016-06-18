extern Image mask;
extern number time;

vec2 stepSize = love_ScreenSize.xy;

#ifdef VERTEX
vec4 position(mat4 transform_projection, vec4 vertex_position)
{
    // The order of operations matters when doing matrix multiplication.
    return transform_projection * vertex_position;
}
#endif

#ifdef PIXEL
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
	number add = time/10;
	//disp = clamp(disp, 0.001, 0.9999);
	vec4 maskcolor = Texel(mask, texture_coords);
	number disp = mod(maskcolor.r+add, 1.0) * 1/stepSize.y * 40;
	//vec4 sum = vec4(disp, disp, disp, disp);
	//vec4 resultOne = vec4(mod(maskcolor.x + sum.x, 1.0), mod(maskcolor.y + sum.y, 1.0), mod(maskcolor.z + sum.z, 1.0), mod(maskcolor.w + sum.w, 1.0));
    vec4 texturecolor = Texel(texture, texture_coords + vec2(0, disp));
    //vec4 result = resultOne * texturecolor;
    return texturecolor * color;
}
#endif