class_name GuidebookFolklore
extends AspectRatioContainer

@onready var _folklore_name: Label = %FolkloreName
@onready var _folklore_description: RichTextLabel = %FolkloreDescription
@onready var _folklore_icon: TextureRect = %FolkloreIcon
@onready var _folklore_animation_player: AnimationPlayer = %FolkloreAnimationPlayer

func _ready() -> void:
	_connect_signals()
	(self as GuidebookFolklore).pivot_offset = (self as GuidebookFolklore).size/2
	init_guidebook_folklore("bastet", true)

func init_guidebook_folklore(folklore_db_name: String, is_on_right: bool) -> void:
	var path_to_png: String = DBElements.get_folklore_element_icon_path(folklore_db_name)
	_folklore_icon.texture = load(path_to_png) as CompressedTexture2D
	_folklore_name.text =  DBElements.get_folklore_element_name(folklore_db_name)
	_folklore_description.text =  DBElements.get_folklore_element_description(folklore_db_name)
	if(is_on_right):
		_folklore_icon.flip_h = true
	if(DBElements.get_folklore_state(folklore_db_name) == "open"):
		_show_folklore_icon()

func _show_folklore_icon() -> void:
	_folklore_icon.material = null

func _connect_signals() -> void:
	(self as GuidebookFolklore).resized.connect(_on_resized)

func _on_resized() -> void:
	(self as GuidebookFolklore).pivot_offset = (self as GuidebookFolklore).size/2
