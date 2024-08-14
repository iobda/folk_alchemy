shader_type canvas_item;

void fragment() {
	COLOR.rgb = vec3(1.0);
	if( COLOR.a < 0.4){
		COLOR.rgb = vec3(0.0);
	}
}
