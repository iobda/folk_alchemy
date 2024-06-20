extends Control

@onready var toggle_sfx: Button = %ToggleSFX
@onready var turn_on_music: Button = %TurnOnMusic
@onready var toggle_off_music: Button = %TurnOffMusic

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if toggle_sfx.pressed.connect(_on_pressed_play_sfx): printerr("Fail: ",get_stack())
	if turn_on_music.pressed.connect(_on_pressed_turn_on_music): printerr("Fail: ",get_stack())
	if toggle_off_music.pressed.connect(_on_pressed_turn_off_music): printerr("Fail: ",get_stack())

func _on_pressed_play_sfx()->void:
	var rand: int = randi_range(0,2)
	match rand:
		0:
			SoundManager.play_ui_click_sfx()
			toggle_sfx.text = " Play SFX (UI sound has been played)"
		1:
			SoundManager.play_sucess_sfx()
			toggle_sfx.text = "Play SFX (Sucess sfx sound has been played)"
		2:
			SoundManager.play_unsucess_sfx()
			toggle_sfx.text = "Play SFX (Unsucess sfx sound has been played)"

func _on_pressed_turn_on_music()->void:
	SoundManager.play_music()
	
func  _on_pressed_turn_off_music()->void:
	SoundManager.stop_music()
