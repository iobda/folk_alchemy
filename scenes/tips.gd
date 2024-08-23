extends VBoxContainer

signal tips_available_updated(tips: int)

var result: String
var _tiped_folklore: String = "none"
var _tips_available: int = 3:
	set(new_amount):
		_tips_available = new_amount
		if(_tips_available == 0 or _tips_available == 1):
			_change_tip_button_icon()
			_ad_button.visible = true
		else:
			_ad_button.visible = false
		tips_available_updated.emit(new_amount)
		_tips_amount.text = str(new_amount)

@onready var _tips_amount: Label = %TipsAmount
@onready var _left_element: TipElement = %LeftElement
@onready var _right_element: TipElement = %RightElement
@onready var _tip_button: TextureButton = %TipButton
@onready var _plus_texture: TextureRect = %PlusTexture
@onready var _ad_button: TextureButton = %AdButton

func _ready() -> void:
	_tips_amount.text = str(_tips_available)
	_plus_texture.hide()
	_connect_signals()
	_init_elements()

func _connect_signals() -> void:
	_tip_button.pressed.connect(_on_tip_button_pressed)
	_ad_button.pressed.connect(_reward_ad_button_press)
	Events.merged.connect(_on_merged)
	YandexSDK.rewarded_ad.connect(rewarded)

func _init_elements() -> void:
	_left_element.is_right = false
	_left_element.is_right = true
	_ad_button.visible = false

func _disable_elements() -> void:
	_left_element.disable_tip_element()
	_right_element.disable_tip_element()
	_plus_texture.hide()

func _enable_elements() -> void:
	_left_element.enable_tip_element()
	_right_element.enable_tip_element()
	_plus_texture.show()

func _on_tip_button_pressed() -> void:
	SoundManager.play_ui_click_sfx()
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
		_tip_button.texture_normal = load("res://assets/icons/clue.png") as CompressedTexture2D
	elif (_tips_available == 0):
		_tip_button.texture_normal = load("res://assets/icons/clue_not.png") as CompressedTexture2D

func _reward_ad_button_press() -> void:
	YandexSDK.show_rewarded_ad()

func rewarded(result: Array) -> void:
	if typeof(result) == TYPE_ARRAY and result.size() > 0:
		var status: String = result[0]
		if status == 'rewarded':
			_tips_available += 1
			YandexSDK.print_info('rewarded')
		if status == 'opened':
			YandexSDK.print_info('rewarded ad - opened')
		if status == 'closed':
			YandexSDK.print_info('rewarded ad - closed')
		if status == 'error':
			YandexSDK.print_info('rewarded ad - error')
