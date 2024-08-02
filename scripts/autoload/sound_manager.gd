extends Node

var _music: AudioStreamPlayer
var _sucess_sfx: AudioStreamPlayer
var _unsucess_sfx: AudioStreamPlayer
var _ui_click_sfx: AudioStreamPlayer
var what: int

func _ready() -> void:
	#music
	_music = AudioStreamPlayer.new()
	_music.bus = "Music"
	_music.stream = preload("res://assets/sound_and_music/Etirwer-_Looped_ theme.wav")
	#
	#sucess_sfx
	_sucess_sfx = AudioStreamPlayer.new()
	_sucess_sfx.bus = "SFX"
	_sucess_sfx.stream = preload("res://assets/sound_and_music/matched.wav")
	#
	#unsucess_sfx
	_unsucess_sfx = AudioStreamPlayer.new()
	_unsucess_sfx.bus = "SFX"
	_unsucess_sfx.stream = preload("res://assets/sound_and_music/not_matched.wav")
	#
	#ui_click_sfx
	_ui_click_sfx = AudioStreamPlayer.new()
	_ui_click_sfx.bus = "SFX"
	_ui_click_sfx.stream = preload("res://assets/sound_and_music/ui_click.wav")
	#
	add_child(_music)
	add_child(_sucess_sfx)
	add_child(_unsucess_sfx)
	add_child(_ui_click_sfx)
	_notification(what)

func play_music()->void:
	_music.play()

func stop_music()->void:
	_music.stop()

func play_ui_click_sfx()->void:
	_ui_click_sfx.play()

func play_sucess_sfx()->void:
	_sucess_sfx.play()

func play_unsucess_sfx()->void:
	_unsucess_sfx.play()

func _notification(what: int) -> void:
	if what == MainLoop.NOTIFICATION_APPLICATION_FOCUS_IN: AudioServer.set_bus_mute(0, false)
	elif what == MainLoop.NOTIFICATION_APPLICATION_FOCUS_OUT: AudioServer.set_bus_mute(0, true)
