extends Node

var what: int = 0

@onready var _background_music: AudioStreamPlayer = %BackgroundMusic
@onready var _click_sound: AudioStreamPlayer = %ClickSound
@onready var _merge_succes_sound: AudioStreamPlayer = %MergeSuccesSound
@onready var _merge_failed_sound: AudioStreamPlayer = %MergeFailedSound

func _ready() -> void:
	_notification(what)

func play_music() -> void:
	_background_music.play()

func stop_music() -> void:
	_background_music.stop()

func play_ui_click_sfx() -> void:
	_click_sound.play()

func stop_ui_click_sfx() -> void:
	_click_sound.stop()

func play_sucess_sfx() -> void:
	_merge_succes_sound.play()

func play_unsucess_sfx() -> void:
	_merge_failed_sound.play()

func _notification(what: int) -> void:
	if what == MainLoop.NOTIFICATION_APPLICATION_FOCUS_IN: AudioServer.set_bus_mute(0, false)
	elif what == MainLoop.NOTIFICATION_APPLICATION_FOCUS_OUT: AudioServer.set_bus_mute(0, true)
