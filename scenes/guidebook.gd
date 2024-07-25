class_name GuideBook
extends CanvasLayer

@export var _guide_book_folklores: Array[GuidebookFolklore] 

var _current_page: int = 0

@onready var _exit: TextureButton = %Exit
@onready var _prev_page: TextureButton = %PrevPage
@onready var _next_page: TextureButton = %NextPage

func _ready() -> void:
	_init_guidebook()
	_connect_signals()

func _init_guidebook() -> void:
	_current_page = (get_tree().current_scene as GameState).last_current_page

func _connect_signals() -> void:
	_exit.pressed.connect(_on_exit_pressed)
	_prev_page.pressed.connect(_on_prev_page_pressed)
	_next_page.pressed.connect(_on_next_page_pressed)

func _update_page() -> void:
	pass

func _on_exit_pressed() -> void:
	queue_free()

func _on_next_page_pressed() -> void:
	pass

func _on_prev_page_pressed() -> void:
	pass

