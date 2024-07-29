class_name GuideBook
extends CanvasLayer

@export var _guide_book_folklores: Array[GuidebookFolklore] 

var _current_page: int = 0:
	set(new_value):
		if(new_value >= _pages or new_value < 0):
			printerr("Fail: assigned value that's overflow maximum amount of pages or <0",get_stack())
		else:
			_current_page = new_value
			_update_page()
			_update_buttons()
	get:
		return _current_page
var _pages: int = 0:
	set(new_value):
		if(_pages == 0):
			_pages = new_value
		else:
			return
	get:
		return _pages 

@onready var _exit: TextureButton = %Exit
@onready var _left_arrow_button: ArrowButton = %LeftArrowButton
@onready var _right_arrow_button: ArrowButton = %RightArrowButton

func _ready() -> void:
	_init_guidebook()
	_connect_signals()

func _init_guidebook() -> void:
	var folkore_count: int = DBElements.get_folklores_elements_bd_names().size()
	var all_pages: int = folkore_count/4
	if(folkore_count%4 != 0):
		all_pages+=1
	_pages = all_pages
	if(is_instance_valid((get_tree().current_scene as GameState))):
		_current_page = (get_tree().current_scene as GameState).last_current_page
	else:
		_current_page = 0

func _connect_signals() -> void:
	_exit.pressed.connect(_on_exit_pressed)
	_left_arrow_button.arrow_button_pressed.connect(_on_prev_page_pressed)
	_right_arrow_button.arrow_button_pressed.connect(_on_next_page_pressed)

func _update_page() -> void:
	var folklores_bd_names: Array[String] = DBElements.get_folklores_elements_bd_names()
	folklores_bd_names = folklores_bd_names.slice(_current_page * 4,(_current_page + 1) * 4)
	for folk: GuidebookFolklore in _guide_book_folklores:
		if(folklores_bd_names.size() - (_guide_book_folklores.find(folk) + 1) < 0):
			folk.z_index = -1
		else:
			folk.set_guidebook_folklore(folklores_bd_names[_guide_book_folklores.find(folk)])
			folk.z_index = 0

func _update_buttons() -> void:
	if(_current_page + 1 != _pages):
		_right_arrow_button.make_available()
	else:
		_right_arrow_button.make_unavailable()
	if(_current_page - 1 != -1):
		_left_arrow_button.make_available()
	else:
		_left_arrow_button.make_unavailable()

func _on_exit_pressed() -> void:
	if(is_instance_valid((get_tree().current_scene as GameState))):
		(get_tree().current_scene as GameState).last_current_page = _current_page
	queue_free()

func _on_prev_page_pressed() -> void:
	if(_current_page != 0):
		_current_page-=1
	_update_buttons()

func _on_next_page_pressed() -> void:
	if(_current_page + 1 != _pages):
		_current_page+=1
	_update_buttons()
