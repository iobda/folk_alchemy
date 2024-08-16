extends TextureButton

var _how_to_play_pc: PackedScene = preload("res://scenes/how_to_play.tscn")

@onready var _how_to_play_button: TextureButton = %HowToPlayButton

func _ready() -> void:
	connect_signals()

func connect_signals() -> void:
	_how_to_play_button.pressed.connect(_on_how_to_play_pressed)

func _on_how_to_play_pressed() -> void:
	SoundManager.play_ui_click_sfx()
	var how_to_play: HowToPlay = _how_to_play_pc.instantiate() as HowToPlay
	add_child(how_to_play)
