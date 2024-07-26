shader_type canvas_item;

uniform bool is_visible = true;

void fragment(){
	if (COLOR.a > 0.12 && !is_visible){
		COLOR = vec4(0.68, 0.6, 0.57, 1.0);
	}
}