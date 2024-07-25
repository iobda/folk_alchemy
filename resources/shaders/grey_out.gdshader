shader_type canvas_item;

void fragment(){
	if (COLOR.a > 0.12){
		COLOR = vec4(0.68, 0.6, 0.57, 1.0);
	}
}