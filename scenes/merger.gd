extends Control

@onready var _animation_player: AnimationPlayer = %AnimationPlayer
@onready var _left_element: Element = %LeftElement
@onready var _right_element: Element = %RightElement

func _ready() -> void:
	_right_element.is_right = true
	_left_element.is_right = false
	_connect_signals()

func _connect_signals() -> void:
	Events.merged.connect(_animation_merge)
	Events.right_element_chosen.connect(_on_right_element_chosen)
	Events.left_element_chosen.connect(_on_left_element_chosen)
	_animation_player.animation_started.connect(_on_animation_started)
	_animation_player.animation_finished.connect(_on_animation_finished)

func _on_right_element_chosen(element_db_name: String)->void:
	_right_element.set_element_data(element_db_name)
	#Access violation due to unconvinient design
	_right_element._animation_player.stop()

func _on_left_element_chosen(element_db_name: String)->void:
	_left_element.set_element_data(element_db_name)
	#Access violation due to unconvinient design
	_left_element._animation_player.stop()

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
