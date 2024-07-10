extends Label

var _all_folk_count: int = DBElements._folklores.size()
var _current_opened: int = 0
var _counter_text: String = "none"

@onready var folklore_counter: Label = %FolkloreCounter

func _ready() -> void:
	Events.merged.connect(_on_merged)

func _on_merged(_folklore_db_name: String) -> void:
	_current_opened+=1
	_counter_text = str(_current_opened) + " / " + str(_all_folk_count)
	folklore_counter.text = _counter_text
