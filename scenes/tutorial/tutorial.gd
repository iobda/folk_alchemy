class_name Tutorial
extends Control

@onready var _exit: TextureButton = %Exit
@onready var _folklore_icon: TextureRect = %FolkloreIcon
@onready var _shader_pulsar_first: PanelContainer = %ShaderPulsarFirst
@onready var _shader_pulsar_second: PanelContainer = %ShaderPulsarSecond

func _ready() -> void:
	_shader_pulsar_first.material.set("shader_parameter/is_turn_on", true)
	_shader_pulsar_second.material.set("shader_parameter/is_turn_on", true)
	_folklore_icon.material.set("shader_parameter/is_visible", false)
	connect_signals()

func connect_signals() -> void:
	_exit.pressed.connect(_on_pressed_exit)

func _on_pressed_exit() -> void:
	Events.tutorial_complete = true
	SoundManager.play_ui_click_sfx()
	queue_free()
