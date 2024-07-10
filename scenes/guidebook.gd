class_name GuideBook
extends CanvasLayer

@onready var _exit: Button = %Exit
@onready var _folklore_list: VBoxContainer = %FolkloreList
@onready var _folklore_window_animations: AnimationPlayer = %FolkloreWindowAnimations
var _folklore_pc: PackedScene = preload("res://scenes/guidebook_folklore.tscn")

func _ready() -> void:
	_connect_signals()
	_fill_folklore_list()
	_folklore_window_animations.play("scale")

func _connect_signals() -> void:
	_exit.pressed.connect(_on_pressed_exit)
	_folklore_window_animations.animation_started.connect(_on_animation_started)
	_folklore_window_animations.animation_finished.connect(_on_animation_finished)

func _fill_folklore_list() -> void:
	for key: String in DBElements._folklores.keys():
		var folklore_instance: GuidebookFolklore = _folklore_pc.instantiate() as GuidebookFolklore
		_folklore_list.add_child(folklore_instance)
		folklore_instance.get_parametres(key)

func _on_animation_started(_anim_name: StringName) -> void:
	_exit.process_mode = Node.PROCESS_MODE_DISABLED
	_folklore_list.process_mode = Node.PROCESS_MODE_DISABLED

func _on_animation_finished(_anim_name: StringName) -> void:
	_exit.process_mode = Node.PROCESS_MODE_ALWAYS
	_folklore_list.process_mode = Node.PROCESS_MODE_INHERIT

func _on_pressed_exit() -> void:
	_folklore_window_animations.play("descale")
	await _folklore_window_animations.animation_finished
	queue_free()

