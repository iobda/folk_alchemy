extends Button

@onready var _guidebook: Button = %GuideBookButton
var _guidebook_pc: PackedScene = preload("res://scenes/guidebook.tscn")

func _ready() -> void:
	_connect_signals()

func _connect_signals() -> void:
	_guidebook.pressed.connect(_on_guidebook_pressed)

func _on_guidebook_pressed() -> void:
	var folklore_guidebooke: GuideBook = _guidebook_pc.instantiate() as GuideBook
	add_child(folklore_guidebooke)
