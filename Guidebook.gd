class_name GuideBook
extends CanvasLayer

@onready var _exit: Button = %Exit
@onready var folklore_list: VBoxContainer = %FolkloreList
var _folklore_pc: PackedScene = preload("res://scenes/Guidebook_folklore.tscn")

func _ready() -> void:
	_exit.pressed.connect(queue_free)
	_fill_folklore_list()

func _fill_folklore_list() -> void:
	for key: String in DBElements._folklores.keys():
		var folklore_instance: GuidebookFolklore = _folklore_pc.instantiate() as GuidebookFolklore
		folklore_list.add_child(folklore_instance)
		folklore_instance.get_parametres(key)
