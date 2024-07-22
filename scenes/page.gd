extends AspectRatioContainer

#Be aware - with some change in this class these export may be gone away or set to default
@export var _is_right_page: bool
@export var _elements: Array[Element]
@export var _categories: Array[Category]


func _ready() -> void:
	Events.category_opened.connect(_on_category_opened)
	for elem: Element in _elements:
		elem.is_right = _is_right_page
	for catyg: Category in _categories:
		catyg.is_right = _is_right_page

func _on_category_opened(category: DBElements.CategoryType, category_is_right: bool)->void:
	if(_is_right_page == category_is_right):
		var elements_names: Array[String] = DBElements.get_elements_by_category(category)
		var i: int = 0
		for elem_name: String in elements_names:
			_elements[i].set_element_data(elem_name)
			i+=1
		for elem: Element in _elements:
			if(elem.element_name.text == ""):
				elem.disable_element()
			else:
				elem.enable_element()
	else:
		return
