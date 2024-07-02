extends Control

signal left_click_lc

var label_name: String #label name, entered manually in game.tscn
var category_name: String #new variable needed for script

@onready var category_icon: TextureRect = $CategoryIcon
@onready var label: Label = $CategoryName


func _ready() -> void:
	get_label_name()
	category_name_finder()
	category_icon_set()


func get_label_name() -> void: #category name from label "CategoryName"
	label_name = $CategoryName.get_text()
	category_name = label_name


func category_name_finder(): #check category exists
	if category_name in Global.actual_item_groups:
		for el in Global.all_elements.keys():
			if category_name in Global.all_elements[el]["categories"]:
				print(category_name)


func category_icon_set(): #category icon set from ResLoader
	$CategoryIcon.set_texture(ResLoader.category_icons[category_name])


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Events.left_click_lc.emit()
			print(category_name, " - left click left category")
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			Events.right_click_lc.emit()
			print(category_name, " - right click left category")


func send_event():
	Events.emit_signal("left_click_lc")
	Events.emit_signal("right_click_lc")
