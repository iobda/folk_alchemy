class_name ArrowButton
extends AspectRatioContainer

signal arrow_button_pressed()

@export var is_right_button: bool = true

@onready var _the_button: TextureButton = %TheButton
@onready var arrow_button_animation_player: AnimationPlayer = %ArrowButtonAnimationPlayer

func _ready() -> void:
	_connect_signals()
	_init_button()

func make_available() -> void:
	(self as ArrowButton).z_index = 0

func make_unavailable() -> void:
	(self as ArrowButton).z_index = -1

func _connect_signals() -> void:
	(self as AspectRatioContainer).resized.connect(_on_resized)
	_the_button.pressed.connect(_on_pressed)
	_the_button.mouse_entered.connect(_on_mouse_entered)
	_the_button.mouse_exited.connect(_on_mouse_exited)
	
func _init_button() -> void:
	if(is_right_button):
		_the_button.flip_h = true
	else:
		_the_button.flip_h = false

func _on_resized() -> void:
	(self as AspectRatioContainer).pivot_offset = (self as AspectRatioContainer).size/2

func _on_pressed() -> void:
	SoundManager.play_ui_click_sfx()
	arrow_button_animation_player.play("bubble_up")
	arrow_button_pressed.emit()

func _on_mouse_entered() -> void:
	var _tween: Tween = get_tree().create_tween()
	_tween.tween_property((self as AspectRatioContainer),"scale",Vector2(1.2,1.2),GlobalVariables.ANIMATION_IN_TIMING)
	
func _on_mouse_exited() -> void:
	var _tween: Tween = get_tree().create_tween()
	_tween.tween_property((self as AspectRatioContainer),"scale",Vector2(1,1),GlobalVariables.ANIMATION_OUT_TIMING)
