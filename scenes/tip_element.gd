class_name TipElement
extends Element


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()


func _connect_signals() -> void:
	element_texture_button.pressed.connect(_on_texture_button_pressed)
	return

func _on_texture_button_pressed() -> void:
	super()
