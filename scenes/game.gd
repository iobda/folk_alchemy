extends Control

var _right_element_selected: String = "none"
var _left_element_selected: String = "none"

var popup_folklore_pc: PackedScene = preload("res://scenes/pop_folklore.tscn")

@onready var _right_label: Label = %DebugLabel_1
@onready var _left_label: Label = %DebugLabel_2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#debug line
	_right_label.text = _right_element_selected
	#debug line
	_left_label.text = _left_element_selected
	Events.category_closed.connect(_on_category_closed)
	Events.element_chosen.connect(_on_element_chosen)


func _on_category_closed(is_right: bool)->void:
	if(is_right):
		_right_element_selected = "none"
		#debug line
		_right_label.text = "Right is " + "none"
	else:
		_left_element_selected = "none"
		#debug line
		_left_label.text = "Left is " +  "none"

func _on_element_chosen(element_db_name: String ,is_right: bool)->void:
	if(is_right):
		_right_element_selected = element_db_name
		#debug line
		_right_label.text = "Right is " + element_db_name
	else:
		_left_element_selected = element_db_name
		#debug line
		_left_label.text = "Left is " + element_db_name
	if(_right_element_selected != "none" and _left_element_selected != "none"):
		var folkore_bd_name: String = _match()
		if(folkore_bd_name != "none"):
			_spawn_popup_folklore(folkore_bd_name)

func _match() -> String:
	for key: String in DBElements.folklores.keys() as Array[String]:
		var folklore_dict: Dictionary = DBElements.folklores.get(key)
		var source_1: String = folklore_dict.get("source_1")
		var source_2: String = folklore_dict.get("source_2")
		if( source_1 == _right_element_selected and source_2 == _left_element_selected or
			source_2 == _right_element_selected and source_1 == _left_element_selected):
				folklore_dict["state"] = "open"
				_right_element_selected = "none"
				_left_element_selected = "none"
				return key
	return "none"

func _spawn_popup_folklore(folklore_bd_name: String)->void:
	var popup_folklore: PopUpFolklore = popup_folklore_pc.instantiate() as PopUpFolklore
	add_child(popup_folklore)
	popup_folklore.set_popup_data(folklore_bd_name)
