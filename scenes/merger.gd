extends Control

@onready var _animation_player: AnimationPlayer = %AnimationPlayer
@onready var _left_element: MergeElement = %LeftElement
@onready var _right_element: MergeElement = %RightElement

func _ready() -> void:
	_connect_signals()

func _connect_signals() -> void:
	Events.merged.connect(_animation_merge)
	_animation_player.animation_started.connect(_on_animation_started)
	_animation_player.animation_finished.connect(_on_animation_finished)

func _animation_merge(folkore_bd_name: String) -> void:
	SoundManager.stop_ui_click_sfx()
	SoundManager.play_sucess_sfx()
	_animation_player.play("Merge")
	await _animation_player.animation_finished
	_spawn_popup(folkore_bd_name)

func _spawn_popup(folkore_bd_name: String) -> void:
	Events.spawn_popup.emit(folkore_bd_name)

func _on_animation_started(_anim_name: String) -> void:
	get_tree().get_root().set_disable_input(true)

func _on_animation_finished(_anim_name: String) -> void:
	get_tree().get_root().set_disable_input(false)
