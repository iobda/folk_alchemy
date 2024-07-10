class_name TipElement
extends Element


func _ready() -> void:
	super()

func enable_tip_element() -> void:
	element_texture_button.disabled = false

func disable_tip_element() -> void:
	element_texture_button.disabled = true
	element_name.text = ""
	element_texture_button.texture_normal = null

func _connect_signals() -> void:
	element_texture_button.pressed.connect(_on_texture_button_pressed)
	return

func _on_texture_button_pressed() -> void:
	super()
