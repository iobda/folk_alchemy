extends Control

var _right_element_selected: String = "none"
var _left_element_selected: String = "none"
var _popup_folklore_pc: PackedScene = preload("res://scenes/pop_folklore.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.category_closed.connect(_on_category_closed)
	Events.element_chosen.connect(_on_element_chosen)

func _on_category_closed(is_right: bool)->void:
	if(is_right):
		_right_element_selected = "none"
	else:
		_left_element_selected = "none"

func _on_element_chosen(element_db_name: String ,is_right: bool)->void:
	if(is_right):
		_right_element_selected = element_db_name
	else:
		_left_element_selected = element_db_name
	if(_right_element_selected != "none" and _left_element_selected != "none"):
		_process_merge()
		_left_element_selected = "none"
		_right_element_selected = "none"

func _process_merge() -> void:
	var folkore_bd_name: String = DBElements.get_folklore_element_name_by_sources(_left_element_selected,_right_element_selected)
	if(folkore_bd_name != "none" and folkore_bd_name != "invalid_sources" and DBElements.is_folklore_element_closed(folkore_bd_name)):
		DBElements.set_folklore_element_to_open(folkore_bd_name)
		_spawn_popup_folklore(folkore_bd_name)
		Events.merged.emit(folkore_bd_name)

func _spawn_popup_folklore(folklore_bd_name: String)->void:
	var popup_folklore: PopUpFolklore = _popup_folklore_pc.instantiate() as PopUpFolklore
	add_child(popup_folklore)
	popup_folklore.set_popup_data(folklore_bd_name)
