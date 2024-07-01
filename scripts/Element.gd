extends Control

var element_name: String = "empty"
var display_name: String = "empty"

func _ready():
	pass

func set_element_icon(data: String):
	%Element_icon.set_texture(ResLoader.element_icons[data])

func set_element_label(data: String):
	%Element_name.set_text(Global.element_name)

func set_item_groups():
	add_to_group("all_categories")
	for cat in Global.all_elements[element_name]["categories"]:
		add_to_group(cat)

func set_parameters(element: String):
	display_name = Global.all_elements[element].name
	element_name = element
	set_element_icon(element)
	set_element_label(element)
	set_item_groups()
