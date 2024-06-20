extends Control
class_name elementCategory

signal clicked

var category_name: String = "empty"

func set_parameters(key: String):
	category_name = key
	%Icon.set_texture(ResLoader.category_icons[key])
