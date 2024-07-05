class_name Category
extends Control

@export  var _category: DBElements.CategoryType

#If left hen false
var is_right: bool
var _is_opened: bool = false

@onready var _category_texture_button: TextureButton = %CategoryTextureButton
@onready var _category_label: Label = %CategoryLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_category_label.text = DBElements.get_category_name(_category)
	var path_to_icon: String = DBElements.get_category_icon_path(_category)
	_category_texture_button.texture_normal = load(path_to_icon) as CompressedTexture2D
	_category_texture_button.pressed.connect(_category_pressed)
	Events.category_opened.connect(_on_category_opened)
	Events.category_closed.connect(_on_category_closed)


func _category_pressed()->void:
	if(_is_opened):
		Events.category_closed.emit(is_right)
		_is_opened = false
	else:
		Events.category_opened.emit(_category, is_right)
		_is_opened = true

func _on_category_opened(in_category: DBElements.CategoryType, is_right_category: bool)->void:
	if(is_right_category != is_right):
		return
	if(in_category != _category):
		(self as Category).hide()
		(self as Category).process_mode = Node.PROCESS_MODE_DISABLED

func _on_category_closed(is_right_category: bool)->void:
	if(is_right == is_right_category):
		(self as Category).show()
		(self as Category).process_mode = Node.PROCESS_MODE_ALWAYS
