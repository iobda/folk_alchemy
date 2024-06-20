extends Control

var element_icons: Dictionary
var category_icons: Dictionary

func _ready():
	load_element_icons()
	load_category_icons()

func load_element_icons():
	for key in Global.all_elements.keys():
		if ResourceLoader.exists("res://assets/element-icons/%s.png" % key):
			element_icons[key] = load("res://assets/element-icons/%s.png" % key)
		else:
			element_icons[key] = load("res://assets/element-icons/error.png")
			Global.print_info(key + " - иконка элемента не найдена")

func load_category_icons():
	for key in Global.actual_element_category:
		if ResourceLoader.exists("res://assets/category-icons/%s.png" % key):
			category_icons[key] = load("res://assets/category-icons/%s.png" % key)
		else:
			category_icons[key] = load("res://assets/category-icons/error.png")
			Global.print_info(key + " - иконка категории не найдена")
