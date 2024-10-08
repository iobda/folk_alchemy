extends Label

var _all_folk_count: int = DBElements.get_folklores_elements_bd_names().size()
var _counter_opened: int = 0
var _check_state: String = "none"
var _counter_text: String = "none"

@onready var folklore_counter: Label = %FolkloreCounter

func _ready() -> void:
	_connect_signals()

func _init_counter() -> void:
	for folk: String in DBElements.get_folklores_elements_bd_names():
		if(DBElements.get_folklore_state(folk) == "opened"):
			_counter_opened+=1
	folklore_counter.text = str(_counter_opened) + " Фольклоров из " + str(_all_folk_count)

func _connect_signals() -> void:
	Events.merged.connect(_on_merged)
	Events.player_data_loaded.connect(_on_player_data_loaded)
	Events.popup_closed.connect(_on_popup_closed)

func _on_merged(folklore_db_name: String) -> void:
	_check_state = DBElements.get_folklore_state(folklore_db_name)
	if _check_state == "opened":
		_counter_opened += 1
	_counter_text = str(_counter_opened) + " Фольклоров из "  + str(_all_folk_count)
	folklore_counter.text = _counter_text

func _on_popup_closed(_left_element_selected: String, _right_element_selected: String) -> void:
	if _counter_opened % 8 == 0:
		YandexSDK.show_interstitial_ad()

func _on_player_data_loaded() -> void:
	_init_counter()
