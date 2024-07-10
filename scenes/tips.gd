extends Control

signal  tips_available_updated(tips: int)

const MERGES_LIMIT: int = 2

var _tiped_folklore: String = "none"
var _tips_available: int = 3:
	set(new_amount):
		_tips_available = new_amount
		tips_available_updated.emit(new_amount)
		_tips_amount.text = str(new_amount)
		if(new_amount == 0):
			_tip_button.disabled = true

var _merges_to_obtain_tip: int = 0:
	set(new_amount):
		if(new_amount == MERGES_LIMIT):
			_tips_available+=1
			_merges_to_obtain_tip = 0
		elif(new_amount < 0):
			return
		else:
			_merges_to_obtain_tip+=new_amount
		_tips_obtaining_progress.text = str(_merges_to_obtain_tip) + "/" + str(MERGES_LIMIT)


@onready var _tips_amount: Label = %TipsAmount
@onready var _tips_obtaining_progress: Label = %TipsObtainingProgress
@onready var _left_element: TipElement = %LeftElement
@onready var _right_element: TipElement = %RightElement
@onready var _tip_button: TextureButton = %TipButton

func _ready() -> void:
	_tips_amount.text = str(_tips_available)
	_tips_obtaining_progress.text = str(_merges_to_obtain_tip) + "/" + str(MERGES_LIMIT)
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
	if(_tiped_folklore != folklore_db_name):
		_merges_to_obtain_tip+=1;
	else:
		_disable_elements()
		_tip_button.disabled = false
