extends TextureButton

@onready var _guidebook: TextureButton = %GuideBookButton
var _guidebook_pc: PackedScene = preload("res://scenes/guidebook.tscn")

func _ready() -> void:
	_connect_signals()

func _connect_signals() -> void:
	_guidebook.pressed.connect(_on_guidebook_pressed)
	_guidebook.mouse_entered.connect(_on_mouse_entered)
	_guidebook.mouse_exited.connect(_on_mouse_exited)

func _on_guidebook_pressed() -> void:
	var folklore_guidebooke: GuideBook = _guidebook_pc.instantiate() as GuideBook
	add_child(folklore_guidebooke)

func _on_mouse_entered() -> void:
	var _tween: Tween = get_tree().create_tween()
	_tween.tween_property(_guidebook,"scale",Vector2(1.2,1.2),GlobalVariables.ANIMATION_IN_TIMING)

func _on_mouse_exited() -> void:
	var _tween: Tween = get_tree().create_tween()
	_tween.tween_property(_guidebook,"scale",Vector2(1,1),GlobalVariables.ANIMATION_OUT_TIMING)
