extends Label

var _all_folk_count: int = DBElements.get_folklores_elements_bd_names().size()
var _counter_opened: int = 0
var _check_state: String = "none"
var _counter_text: String = "none"

@onready var folklore_counter: Label = %FolkloreCounter

func _ready() -> void:
	Events.merged.connect(_on_merged)
	for folk: String in DBElements.get_folklores_elements_bd_names():
		if(DBElements.get_folklore_state(folk) == "opened"):
			_counter_opened+=1
	folklore_counter.text = str(_counter_opened) + " Фольклоров из " + str(_all_folk_count)

func _on_merged(folklore_db_name: String) -> void:
	_check_state = DBElements.get_folklore_state(folklore_db_name)
	if _check_state == "opened":
		_counter_opened += 1
		if _counter_opened % 8 == 0:
			YandexSDK.show_interstitial_ad()
	_counter_text = str(_counter_opened) + " Фольклоров из "  + str(_all_folk_count)
	folklore_counter.text = _counter_text
