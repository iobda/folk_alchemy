class_name DebugPopUpLabel
extends Control

@onready var _debug_label: Label = %DebugLabel
@onready var _disappear_timer: Timer = %DisappearTimer


func _ready() -> void:
	_debug_label.text = str(get_tree().root.size)
	@warning_ignore("integer_division")
	_debug_label.add_theme_font_size_override("font_size", 66 + (get_tree().root.size.x/100 * 2))
	_disappear_timer.timeout.connect(queue_free)
	_delete_others()

func _delete_others() -> void:
	for child: Node in get_parent().get_children():
		if(child is DebugPopUpLabel and child != self):
			child.queue_free()
