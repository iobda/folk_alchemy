extends Control
class_name GuidebookFolklore


@onready var _folklore_name: Label = %FolkloreName
@onready var _folklore_description: RichTextLabel = %FolkloreDescription
@onready var _folklore_icon: TextureRect = %FolkloreIcon

func _ready() -> void:
	pass

func get_parametres(folklore_db_name: String) -> void:
	var path_to_png: String = DBElements.get_folklore_element_icon_path(folklore_db_name)
	_folklore_icon.texture = load(path_to_png) as CompressedTexture2D
	_folklore_name.text =  DBElements.get_folklore_element_name(folklore_db_name)
	_folklore_description.text =  DBElements.get_folklore_element_description(folklore_db_name)
