extends TextureButton

var _guidebook_pc: PackedScene = preload("res://scenes/guidebook.tscn")

@onready var _guidebook: TextureButton = %GuideBookButton

func _ready() -> void:
	_guidebook.pivot_offset = _guidebook.size/2
	_connect_signals()

func _connect_signals() -> void:
	Events.guidebook_closed.connect(_on_guidebook_closed)
	_guidebook.pressed.connect(_on_guidebook_pressed)
	_guidebook.mouse_entered.connect(_on_mouse_entered)
	_guidebook.mouse_exited.connect(_on_mouse_exited)
	_guidebook.resized.connect(_on_resized)

func _on_guidebook_closed() -> void:
	self.show()

func _on_guidebook_pressed() -> void:
	SoundManager.play_ui_click_sfx()
	var folklore_guidebooke: GuideBook = _guidebook_pc.instantiate() as GuideBook
	add_child(folklore_guidebooke)
	self.hide()

func _on_mouse_entered() -> void:
	var _tween: Tween = get_tree().create_tween()
	_tween.tween_property(_guidebook,"scale",Vector2(1.2,1.2),GlobalVariables.ANIMATION_IN_TIMING)

func _on_mouse_exited() -> void:
	var _tween: Tween = get_tree().create_tween()
	_tween.tween_property(_guidebook,"scale",Vector2(1,1),GlobalVariables.ANIMATION_OUT_TIMING)

func _on_resized() -> void:
	_guidebook.pivot_offset = _guidebook.size/2
