extends AspectRatioContainer

@export var is_right_page: bool
@export var elements: Array[Element]
@export var categories: Array[Category]


func _ready() -> void:
	Events.category_opened.connect(_on_category_opened)
	for elem: Element in elements:
		elem.is_right = is_right_page
	for catyg: Category in categories:
		catyg.is_right = is_right_page

func _on_category_opened(category: DBElements.Category, category_is_right: bool)->void:
	if(is_right_page == category_is_right):
		var i : int = 0
		var elements_dic: Array[Variant] = (DBElements.base_elements_by_category.get(category) as Dictionary).keys()
		for elem: String in elements_dic:
			elements[i].set_element_data(elem)
			i+=1
	else:
		return
