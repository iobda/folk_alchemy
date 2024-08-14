class_name MergeElement
extends AspectRatioContainer

@export var is_right: bool = false

@onready var _element_icon: TextureRect = %ElementIcon
@onready var _element_name: Label = %ElementName

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_connect_signals()

func _connect_signals() -> void:
	Events.element_chosen.connect(_on_element_chosen)

func _on_element_chosen(name_of_element: String, in_is_right: bool) -> void:
	if(in_is_right == is_right):
		var icon_path: String = DBElements.get_element_icon_path(name_of_element)
		_element_icon.texture = load(icon_path) as CompressedTexture2D
		_element_name.text = DBElements.get_element_name(name_of_element)
