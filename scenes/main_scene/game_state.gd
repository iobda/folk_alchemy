class_name GameState
extends Control

var last_current_page: int = 0
var _right_element_selected: String = "none":
	set(new_var):
		_right_element_selected = new_var
var _left_element_selected: String = "none":
	set(new_var):
		_left_element_selected = new_var
var _popup_folklore_pc: PackedScene = preload("res://scenes/pop_folklore.tscn")
var _tutorial_page_pc: PackedScene = preload("res://scenes/tutorial/tutorial.tscn")
## Last opened page number in guidebook

@onready var _merger: Control = %Merger

func _ready() -> void:
	_init_game()
	_init_yandex_sdk()
	_connect_signals()
	_tutorial()
	_merger.visible = false

func _init_game() -> void:
	SoundManager.play_music()

func _init_yandex_sdk() -> void:
	YandexSDK.init_game()
	YandexSDK.init_player()
	YandexSDK.show_interstitial_ad()
	YandexSDK.load_all_data()
	YandexSDK.load_all_stats()

func _connect_signals() -> void:
	Events.category_closed.connect(_on_category_closed)
	Events.element_chosen.connect(_on_element_chosen)
	Events.spawn_popup.connect(_spawn_popup_folklore)
	YandexSDK.interstitial_ad.connect(interstitial_ad)
	YandexSDK.data_loaded.connect(data_loaded)

func data_loaded(data: Dictionary) -> void:
	DBElements.update_folklores_state(data)
	Events.player_data_loaded.emit()

func interstitial_ad(result: Array) -> void:
	if typeof(result) == TYPE_ARRAY and result.size() > 0:
		var status: String = result[0]
		if status == 'opened':
			pass
		if status == 'closed':
			pass
		if status == 'error':
			pass

func _tutorial() -> void:
	if Events.tutorial_complete == false:
		var tutorial_page: Tutorial = _tutorial_page_pc.instantiate() as Tutorial
		add_child(tutorial_page)
	else:
		pass

func _on_category_closed(is_right: bool)->void:
	if(is_right):
		_right_element_selected = "none"
	else:
		_left_element_selected = "none"

func _on_element_chosen(element_db_name: String ,is_right: bool)->void:
	if(is_right):
		if _right_element_selected == element_db_name:
			_right_element_selected = "none"
		else:
			_right_element_selected = element_db_name
		Events.right_element_chosen.emit(element_db_name)
	else:
		if _left_element_selected == element_db_name:
			_left_element_selected = "none"
		else:
			_left_element_selected = element_db_name
		Events.left_element_chosen.emit(element_db_name)
	if(_right_element_selected != "none" and _left_element_selected != "none"):
		_process_merge()
		_left_element_selected = "none"
		_right_element_selected = "none"

func _process_merge() -> void:
	var folkore_bd_name: String = DBElements.get_folklore_element_name_by_sources(_left_element_selected,_right_element_selected)
	if(folkore_bd_name != "none" and folkore_bd_name != "invalid_sources" and DBElements.is_folklore_element_closed(folkore_bd_name)):
		DBElements.set_folklore_element_to_open(folkore_bd_name)
		_merger.visible = true
		Events.merged.emit(folkore_bd_name)
	else:
		Events.merge_failed.emit(_left_element_selected, _right_element_selected)

func _spawn_popup_folklore(folklore_bd_name: String)->void:
	var popup_folklore: PopUpFolklore = _popup_folklore_pc.instantiate() as PopUpFolklore
	add_child(popup_folklore)
	popup_folklore.set_popup_data(folklore_bd_name)
