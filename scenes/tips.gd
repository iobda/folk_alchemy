extends VBoxContainer

signal  tips_available_updated(tips: int)

var _tiped_folklore: String = "none"
var _tips_available: int = 3:
	set(new_amount):
		_tips_available = new_amount
		if(_tips_available == 0 or _tips_available == 1):
			_change_tip_button_icon()
		tips_available_updated.emit(new_amount)
		_tips_amount.text = str(new_amount)

@onready var _tips_amount: Label = %TipsAmount
@onready var _left_element: TipElement = %LeftElement
@onready var _right_element: TipElement = %RightElement
@onready var _tip_button: TextureButton = %TipButton

func _ready() -> void:
	_tips_amount.text = str(_tips_available)
	_connect_signals()
	_init_elements()

func _connect_signals() -> void:
	_tip_button.pressed.connect(_on_tip_button_pressed)
	Events.merged.connect(_on_merged)

func _init_elements() -> void:
	_left_element.is_right = false
	_left_element.is_right = true

func _disable_elements() -> void:
	_left_element.disable_tip_element()
	_right_element.disable_tip_element()

func _enable_elements() -> void:
	_left_element.enable_tip_element()
	_right_element.enable_tip_element()

func _on_tip_button_pressed() -> void:
	if(_tips_available == 0):
		return
	_tip_button.disabled = true
	var sources: Array[String]
	for folk: String in DBElements.get_folklores_elements_bd_names():
		if(DBElements.get_folklore_state(folk) == "closed"):
			_enable_elements()
			_tiped_folklore = folk
			sources = DBElements.get_folklores_elements_sources(folk)
			_left_element.set_element_data(sources[0])
			_right_element.set_element_data(sources[1])
			_tips_available-=1
			return

func _on_merged(folklore_db_name: String) -> void:
	if(_tiped_folklore == folklore_db_name):
		_disable_elements()
		_tip_button.disabled = false

func _change_tip_button_icon() -> void:
	if (_tips_available >= 1):
		_tip_button.material.set("shader_parameter/is_grey",false)
	elif (_tips_available == 0):
		_tip_button.material.set("shader_parameter/is_grey",true)
