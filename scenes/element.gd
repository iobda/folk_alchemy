class_name Element
extends Control

#If left then false
var is_right: bool

var _element_db_name: String

@onready var element_texture_button: TextureButton = %ElementTextureButton
@onready var element_name: Label = %ElementName

func _ready() -> void:
	Events.category_opened.connect(_on_category_opened)
	Events.category_closed.connect(_on_category_closed)
	element_texture_button.pressed.connect(_on_texture_button_pressed)

func set_element_data(name_of_element: String) -> void:
	_element_db_name = name_of_element
	var icon_path: String = DBElements.get_element_icon_path(name_of_element)
	element_texture_button.texture_normal = load(icon_path) as CompressedTexture2D
	element_name.text = DBElements.get_element_name(name_of_element)

func _on_category_opened(_category: DBElements.CategoryType, category_is_right: bool)->void:
	if(category_is_right == is_right):
		(self as Element).show()
		element_texture_button.disabled = false

func _on_category_closed(category_is_right: bool)->void:
	if(category_is_right == is_right):
		(self as Element).hide()
		element_texture_button.disabled = true

func _on_texture_button_pressed()->void:
	Events.element_chosen.emit(_element_db_name, is_right)
