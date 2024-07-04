extends Control

var _right_element_selected: String = "Right is none"
var _left_element_selected: String = "Left is none"

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
