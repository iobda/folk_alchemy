class_name GuidebookFolklore
extends AspectRatioContainer

@export var is_right: bool = true

@onready var _folklore_name: Label = %FolkloreName
@onready var _folklore_description: RichTextLabel = %FolkloreDescription
@onready var _folklore_icon: TextureRect = %FolkloreIcon

func _ready() -> void:
	_connect_signals()
	(self as GuidebookFolklore).pivot_offset = (self as GuidebookFolklore).size/2

func _init_guidebook_folklore() -> void:
	if(is_right):
		_folklore_icon.flip_h = true

func set_guidebook_folklore(folklore_db_name: String) -> void:
	var path_to_png: String = DBElements.get_folklore_element_icon_path(folklore_db_name)
	_folklore_icon.texture = load(path_to_png) as CompressedTexture2D
	_folklore_name.text =  "???????"
	_folklore_description.text =  DBElements.get_folklore_element_tip(folklore_db_name)
	if(DBElements.get_folklore_state(folklore_db_name) == "opened"):
		_show_folklore_icon()
		_folklore_description.text =  DBElements.get_folklore_element_description(folklore_db_name)
		_folklore_name.text =  DBElements.get_folklore_element_name(folklore_db_name)
	else:
		_hide_folklore_icon()

func _connect_signals() -> void:
	(self as GuidebookFolklore).resized.connect(_on_resized)

func _show_folklore_icon() -> void:
	_folklore_icon.material.set("shader_parameter/is_visible",true)

func _hide_folklore_icon() -> void:
	_folklore_icon.material.set("shader_parameter/is_visible",false)

func _on_resized() -> void:
	(self as GuidebookFolklore).pivot_offset = (self as GuidebookFolklore).size/2
