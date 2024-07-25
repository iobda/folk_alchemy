class_name GuideBook
extends CanvasLayer

@onready var _exit: TextureButton = %Exit
var _folklore_pc: PackedScene = preload("res://scenes/guidebook_folklore.tscn")

func _ready() -> void:
	_connect_signals()

func _connect_signals() -> void:
	_exit.pressed.connect(_on_pressed_exit)

func _on_pressed_exit() -> void:
	queue_free()

