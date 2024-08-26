extends CanvasLayer

@onready var _ending_texture_rect: TextureRect = %EndingTextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_connect_signals()

func _connect_signals() -> void:
	await get_tree().create_timer(1.5).timeout
	_ending_texture_rect.gui_input.connect(_on_gui_input)

func _on_gui_input(in_input_event: InputEvent) -> void:
	queue_free()
