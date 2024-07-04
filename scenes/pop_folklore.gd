class_name PopUpFolklore
extends CanvasLayer

@onready var folkore_icon: TextureRect = %FolkoreIcon
@onready var folklore_name: Label = %FolkloreName
@onready var folklore_description: RichTextLabel = %FolkloreDescription
@onready var exit: Button = %Exit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit.pressed.connect(queue_free)

func set_popup_data(folklore_db_name: String)->void:
	var folklore: Dictionary = DBElements.folklores.get(folklore_db_name)
	var path_to_png: String = folklore.get("icon") as String
	folkore_icon.texture = load(path_to_png) as CompressedTexture2D
	folklore_name.text = folklore.get("name") as String
	folklore_description.text = folklore.get("description") as String
