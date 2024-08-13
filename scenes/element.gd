class_name Element
extends AspectRatioContainer

#If left then false
var is_right: bool
var _previous_element: String = ""
var _element_db_name: String = ""

@onready var _element_texture_button: TextureButton = %ElementTextureButton
@onready var _element_name: Label = %ElementName
@onready var _animation_player: AnimationPlayer = %AnimationPlayer
@onready var _shader_pulsar: PanelContainer = %ShaderPulsar
@onready var _element_aspect_ratio_container: AspectRatioContainer  = %ElementAspectRatioContainer

func _ready() -> void:
	_init_element()
	_connect_signals()

func _connect_signals() -> void:
	Events.category_closed.connect(_on_category_closed)
	Events.popup_closed.connect(_stop_animation)
	Events.merge_failed.connect(_stop_animation)
	Events.merge_failed.connect(_on_fail_merge)
	Events.element_chosen.connect(_on_element_chosen)
	_element_aspect_ratio_container.resized.connect(_on_resized)
	_animation_player.animation_finished.connect(_on_animation_finished)
	_element_texture_button.pressed.connect(_on_texture_button_pressed)

func set_element_data(name_of_element: String) -> void:
	_element_db_name = name_of_element
	var icon_path: String = DBElements.get_element_icon_path(name_of_element)
	_element_texture_button.texture_normal = load(icon_path) as CompressedTexture2D
	_element_name.text = DBElements.get_element_name(name_of_element)
	_enable_element()

func _init_element() -> void:
	_element_texture_button.texture_normal = null
	_element_name.text = ""
	(self as Element).pivot_offset = (self as Element).size/2.0
	_element_aspect_ratio_container.pivot_offset = _element_aspect_ratio_container.size/2.0

func _enable_element() -> void:
	(self as Element).show()
	(self as Element).process_mode = Node.PROCESS_MODE_INHERIT
	_animation_player.play("appear")

func _disable_element() -> void:
	_animation_player.play("disappear")

func _on_category_closed(category_is_right: bool) -> void:
	if(category_is_right == is_right):
		_disable_element()
		_shader_pulsar.material.set("shader_parameter/is_turn_on", false)

func _stop_animation(_left_element_selected: String, _right_element_selected: String) -> void:
	_clear_animation()

func _on_element_chosen(element_db_name: String , in_is_right: bool) -> void:
	SoundManager.play_ui_click_sfx()
	if(element_db_name != _element_db_name and in_is_right == is_right):
		_clear_animation()

func _on_resized() -> void:
	(self as Element).pivot_offset = (self as Element).size/2.0
	_element_aspect_ratio_container.pivot_offset = _element_aspect_ratio_container.size/2.0

func _on_animation_finished(anim_name: String) -> void:
	if(anim_name == "disappear"):
		(self as Element).hide()
		(self as Element).process_mode = Node.PROCESS_MODE_DISABLED
		_element_texture_button.texture_normal = null
		_element_db_name = ""
		_element_name.text = ""
		_previous_element = ""

func _on_texture_button_pressed() -> void:
	if _element_db_name == _previous_element:
		_clear_animation()
	else:
		_animation_player.play("select")
		_shader_pulsar.material.set("shader_parameter/is_turn_on", true)
		_previous_element = _element_db_name
	Events.element_chosen.emit(_element_db_name, is_right)

func _on_fail_merge(_left_element_selected: String, _right_element_selected: String) -> void:
	if _element_db_name == _left_element_selected or _element_db_name == _right_element_selected:
		SoundManager.stop_ui_click_sfx()
		_animation_player.play("merge_failed")
		SoundManager.play_unsucess_sfx()
		await _animation_player.animation_finished
		_shader_pulsar.material.set("shader_parameter/is_turn_on", false)
		_animation_player.play("RESET")

func _clear_animation() -> void:
	_previous_element = ""
	_shader_pulsar.material.set("shader_parameter/is_turn_on", false)
	_animation_player.play("RESET")
