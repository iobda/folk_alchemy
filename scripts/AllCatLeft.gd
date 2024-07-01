extends Control

var category_name: String = "all_categories"

@onready var acl_label: Label = $ACLLabel
@onready var acl_icon: TextureRect = $ACLIcon

func _ready() -> void:
	category_icon_set()

func category_icon_set(): #category icon set from ResLoader
	$ACLIcon.set_texture(ResLoader.category_icons[category_name])

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print(category_name, " - left click acl")
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			print(category_name, " - right click acl")


