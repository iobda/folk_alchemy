class_name PopUpFolklore
extends CanvasLayer

@onready var _folkore_icon: TextureRect = %FolkoreIcon
@onready var _folklore_name: Label = %FolkloreName
@onready var _folklore_description: RichTextLabel = %FolkloreDescription
@onready var _exit: Button = %Exit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_exit.pressed.connect(on_exit_pressed)

func set_popup_data(folklore_db_name: String)->void:
	var path_to_png: String = DBElements.get_folklore_element_icon_path(folklore_db_name)
	_folkore_icon.texture = load(path_to_png) as CompressedTexture2D
	_folklore_name.text =  DBElements.get_folklore_element_name(folklore_db_name)
	_folklore_description.text =  DBElements.get_folklore_element_description(folklore_db_name)

func on_exit_pressed()->void:
	queue_free()
	Events.popup_closed.emit()
