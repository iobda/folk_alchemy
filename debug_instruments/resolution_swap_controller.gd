extends Node

var _emergable_label_pc: PackedScene = preload("res://debug_instruments/debug_emergable_label.tscn")

func _process(_delta: float) -> void:
	if(Input.is_key_pressed(KEY_KP_0)):
		_change_window_size(Vector2(1920,1080))
	elif(Input.is_key_pressed(KEY_KP_1)):
		_change_window_size(Vector2(1366,768))
	elif(Input.is_key_pressed(KEY_KP_2)):
		_change_window_size(Vector2(1600,900))
	elif(Input.is_key_pressed(KEY_KP_3)):
		_change_window_size(Vector2(1080,1920))
	elif(Input.is_key_pressed(KEY_KP_4)):
		_change_window_size(Vector2(720,1280))
	elif(Input.is_key_pressed(KEY_KP_5)):
		_change_window_size(Vector2(1440,2560))
	elif(Input.is_key_pressed(KEY_KP_6)):
		_change_window_size(Vector2(800,1280))
	elif(Input.is_key_pressed(KEY_KP_7)):
		_change_window_size(Vector2(1280,800))
	elif(Input.is_key_pressed(KEY_KP_8)):
		_change_window_size(Vector2(1200,1920))
	elif(Input.is_key_pressed(KEY_KP_9)):
		_change_window_size(Vector2(720,1600))

func _change_window_size(size: Vector2) -> void:
	get_tree().root.size = size
	get_tree().root.position = Vector2i(0,0)
	add_child(_emergable_label_pc.instantiate())
