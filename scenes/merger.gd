extends Control

var _right_element_selected: String
var _left_element_selected: String

@onready var _animation_player: AnimationPlayer = %AnimationPlayer
@onready var _left_element: Element = %LeftElement
@onready var _right_element: Element = %RightElement

func _ready() -> void:
	_connect_signals()

func _connect_signals() -> void:
	Events.merged.connect(_animation_merge)
	Events.right_element_chosen.connect(set_right_element)
	Events.left_element_chosen.connect(set_left_element)

func set_right_element(element_db_name: String)->void:
	_right_element_selected = element_db_name
	_right_element.set_element_data(_right_element_selected)

func set_left_element(element_db_name: String)->void:
	_left_element_selected = element_db_name
	_left_element.set_element_data(_left_element_selected)

func _animation_merge(folkore_bd_name: String) -> void:
	_animation_player.play("Merge")
	await _animation_player.animation_finished
	spawn_popup(folkore_bd_name)

func spawn_popup(folkore_bd_name: String) -> void:
	Events.spawn_popup.emit(folkore_bd_name)
