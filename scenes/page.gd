extends Control

#Be aware - with some change in this class these export may be gone away or set to default
@export var _is_right_page: bool
@export var _elements: Array[Element]
@export var _categories: Array[Category]


func _ready() -> void:
	_connect_signals()
	for elem: Element in _elements:
		elem.is_right = _is_right_page
	for catyg: Category in _categories:
		catyg.is_right = _is_right_page

func _connect_signals() -> void:
	Events.category_opened.connect(_on_category_opened)

func _on_category_opened(category: DBElements.CategoryType, category_is_right: bool)->void:
	if(_is_right_page == category_is_right):
		var elements_names: Array[String] = DBElements.get_elements_by_category(category)
		var i: int = 0
		for elem_name: String in elements_names:
			_elements[i].set_element_data(elem_name)
			i+=1
	else:
		return

#func _on_category_closed(_in_is_right: bool) -> void:
	#_categories_animation_player.play_backwards("open_categories")
	#_elements_animation_player.play_backwards("open_elements")
#
#func _handle_category_animation(category: DBElements.CategoryType, category_is_right: bool) -> void:
	#var animation: Animation = _categories_animation_player.get_animation("open_categories")
	#var i: int = 2
	#for categ: Category in _categories:
		#if (categ.category == category and categ.is_right == category_is_right):
			#var str_name: String = categ.get_path() as String
			#animation.track_set_key_value(0,0, categ.position)
			#animation.track_set_path(0, categ.get_path() as String + ":position")
			#animation.track_set_path(1, categ.get_path() as String + ":size")
		#elif(categ.category != category and categ.is_right == category_is_right):
			#animation.track_set_path(i, categ.get_path() as String + ":size")
			#i+=1
	#_categories_animation_player.play("open_categories")
	#_elements_animation_player.play("open_elements")
