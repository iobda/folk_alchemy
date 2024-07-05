class_name Category
extends Control

signal folklores_to_merged_changed(_new_amount: int)

@export  var _category: DBElements.CategoryType



#If left hen false
var is_right: bool
var _is_opened: bool = false
var _folklores_to_merged: int = 0:
	set(new_amount):
		_folklores_to_merged = new_amount
		folklores_to_merged_changed.emit(new_amount)

@onready var _category_texture_button: TextureButton = %CategoryTextureButton
@onready var _category_label: Label = %CategoryLabel
#Counter
@onready var _counter_icon: TextureRect = %CounterIcon
@onready var _counter: Label = %Counter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	folklores_to_merged_changed.connect(_on_folklores_to_merged_changed)
	Events.category_opened.connect(_on_category_opened)
	Events.category_closed.connect(_on_category_closed)
	Events.merged.connect(_on_merged)
	_category_label.text = DBElements.get_category_name(_category)
	var path_to_icon: String = DBElements.get_category_icon_path(_category)
	_category_texture_button.texture_normal = load(path_to_icon) as CompressedTexture2D
	_category_texture_button.pressed.connect(_category_pressed)
	_init_counter(_category)


func _init_counter(_category: DBElements.CategoryType) -> void:
	for folklore_db_name: String in DBElements.get_folklores_elements_bd_names():
		var sources: Array[String] = DBElements.get_folklores_elements_sources(folklore_db_name)
		for source: String in sources:
			var tmp_category: DBElements.CategoryType =  DBElements.get_element_category(source)
			if(_category == tmp_category):
				_folklores_to_merged+=1

func _on_merged(folklore_db_name: String) -> void:
	var sources: Array[String] = DBElements.get_folklores_elements_sources(folklore_db_name)
	for source: String in sources:
		if(DBElements.get_element_category(source) == _category):
			_folklores_to_merged-=1
			return

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

func _on_folklores_to_merged_changed(new_amount: int) -> void:
	_counter.text = str(new_amount)
