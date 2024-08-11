class_name HowToPlay
extends CanvasLayer

@onready var _exit: TextureButton = %Exit

func _ready() -> void:
	connect_signals()

func connect_signals() -> void:
	_exit.pressed.connect(_on_pressed_exit)

func _on_pressed_exit() -> void:
	SoundManager.play_ui_click_sfx()
	queue_free()
