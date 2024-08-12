class_name TipElement
extends Element


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	(self as TipElement).hide()
	_element_texture_button.disabled = true

func _connect_signals() -> void:
	return

func enable_tip_element() -> void:
	(self as TipElement).show()
	_element_texture_button.disabled = false

func disable_tip_element() -> void:
	(self as TipElement).hide()
	_element_texture_button.disabled = true
	_element_name.text = ""
	_element_texture_button.texture_normal = null

func _on_texture_button_pressed() -> void:
	super()
