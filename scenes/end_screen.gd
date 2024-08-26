extends CanvasLayer

@onready var _ending_texture_rect: TextureRect = %EndingTextureRect
@onready var _timer: Timer = %Timer

func _input(event: InputEvent) -> void:
	if(_timer.is_stopped()):
		queue_free()
