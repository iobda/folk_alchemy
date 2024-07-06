extends Control

signal  tips_available_updated(tips: int)

const _merges_limit: int = 2
var _tips_available: int = 3:
	set(new_amount):
		_tips_available = new_amount
		tips_available_updated.emit(new_amount)
		_tips_amount.text = str(new_amount)
		if(new_amount == 0):
			_tip_button.disabled = true
		else:
			_tip_button.disabled = false
var _merges_to_obtain_tip: int = 0:
	set(new_amount):
		if(new_amount == _merges_limit):
			_tips_available+=1
			_merges_to_obtain_tip = 0
		elif(new_amount < 0):
			return
		else:
			_merges_to_obtain_tip+=new_amount
		_tips_obtaining_progress.text = str(_merges_to_obtain_tip) + "/" + str(_merges_limit)


@onready var _tips_amount: Label = %TipsAmount
@onready var _tips_obtaining_progress: Label = %TipsObtainingProgress
@onready var _left_element: Element = %LeftElement
@onready var _texture_rect: TextureRect = %TextureRect
@onready var _right_element: Element = %RightElement
@onready var _tip_button: TextureButton = %TipButton


func _ready() -> void:
	_tips_amount.text = str(_tips_available)
	_tips_obtaining_progress.text = str(_merges_to_obtain_tip) + "/" + str(_merges_limit)
	_connect_signals()
	_init_elements()

func _connect_signals() -> void:
	_tip_button.pressed.connect(_on_tip_button_pressed)
	Events.merged.connect(_on_merged)

func _init_elements() -> void:
	_left_element.is_right = false
	_left_element.is_right = true

#TODO algorithm for setting elements to first found closed folklore's sources
func _on_tip_button_pressed() -> void:
	var sources: Array[String]
	for folk: String in DBElements.get_folklores_elements_bd_names():
		if(DBElements.get_folklore_state(folk) == "closed"):
			sources = DBElements.get_folklores_elements_sources(folk)
			_left_element.set_element_data(sources[0])
			_right_element.set_element_data(sources[1])
			_tips_available-=1
			return

func _on_merged(_folklore_db_name: String) -> void:
	_merges_to_obtain_tip+=1;
