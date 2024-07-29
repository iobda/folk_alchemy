extends Control

#Be aware - with some change in this class these export may be gone away or set to default
@export var _is_right_page: bool
@export var _elements: Array[Element]
@export var _categories: Array[Category]

@onready var _categories_animation_player: AnimationPlayer = %CategoriesAnimationPlayer

func _ready() -> void:
	_connect_signals()
	for elem: Element in _elements:
		elem.is_right = _is_right_page
	for catyg: Category in _categories:
		catyg.is_right = _is_right_page
	if(_is_right_page):
		(self as Control).layout_direction = Control.LAYOUT_DIRECTION_RTL

func _connect_signals() -> void:
	Events.category_opened.connect(_on_category_opened)
	Events.category_closed.connect(_on_category_closed)
	_categories_animation_player.animation_started.connect(_on_animation_started)
	_categories_animation_player.animation_finished.connect(_on_animation_finished)

func _handle_category_animation(category: DBElements.CategoryType, category_is_right: bool) -> void:
	for categ: Category in _categories:
		if (categ.category == category):
			if(category_is_right == true):
				var animation: Animation = _categories_animation_player.get_animation("right_focus_move")
				animation.track_set_key_value(0,0, categ.position)
				animation.track_set_path(0, categ.get_path() as String + ":position")
				_categories_animation_player.play("right_focus_move")
			elif(category_is_right == false):
				var animation: Animation = _categories_animation_player.get_animation("left_focus_move")
				animation.track_set_key_value(0,0, categ.position)
				animation.track_set_path(0, categ.get_path() as String + ":position")
				_categories_animation_player.play("left_focus_move")

func _on_category_opened(category: DBElements.CategoryType, category_is_right: bool) -> void:
	if(_is_right_page == category_is_right):
		var elements_names: Array[String] = DBElements.get_elements_by_category(category)
		var i: int = 0
		for elem_name: String in elements_names:
			_elements[i].set_element_data(elem_name)
			i+=1
		_handle_category_animation(category, category_is_right)
	else:
		return

func _on_category_closed(category_is_right: bool) -> void:
	if(_is_right_page == category_is_right and _is_right_page == true):
		_categories_animation_player.play_backwards("right_focus_move")
	if(_is_right_page == category_is_right and _is_right_page == false):
		_categories_animation_player.play_backwards("left_focus_move")

func _on_animation_started(_anim_name: String) -> void:
	for category: Category in _categories:
		category.disable_interaction()

func _on_animation_finished(_anim_name: String) -> void:
	for category: Category in _categories:
		category.enable_interaction()
