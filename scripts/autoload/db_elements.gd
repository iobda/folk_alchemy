extends Node

enum CategoryType {ANIMALS = 0, HUMAN = 1, NATURAL_DISASTERS = 2, EMOTIONS = 3}

var _categories: Dictionary = {
	CategoryType.ANIMALS: {
		"name": "Животные",
		"icon": "res://assets/category-icons/animals.png"
	},
	CategoryType.HUMAN: {
		"name": "Человек",
		"icon": "res://assets/category-icons/human.png"
	},
	CategoryType.NATURAL_DISASTERS: {
		"name": "Стихийные бедствия",
		"icon": "res://assets/category-icons/natural_disasters.png"
	},
	CategoryType.EMOTIONS: {
		"name": "Эмоции",
		"icon": "res://assets/category-icons/emotions.png"
	}
}

var _elements: Dictionary = {
	"cat": {
		"name": "Кошка",
		"icon": "res://assets/element-icons/cat.png",
		"category" : CategoryType.ANIMALS
	},
	"love": {
		"name": "Любовь",
		"icon": "res://assets/element-icons/love.png",
		"category" : CategoryType.EMOTIONS
	}
}

var _folklores: Dictionary ={
	"bastet": {
		"name": "Бастет",
		"icon": "res://assets/folklore/bastet.png",
		"description": "Лорем ипсум пси пси спим",
		"source_1": "cat",
		"source_2": "love",
		"state": "closed"
	}
}

func get_category_name(category: CategoryType) -> String:
	return (_categories.get(category) as Dictionary).get("name") as String

func get_category_icon_path(category: CategoryType) -> String:
	return (_categories.get(category) as Dictionary).get("icon") as String

func get_element_name(element_db_name: String) -> String:
	return (_elements.get(element_db_name) as Dictionary).get("name") as String

func get_element_icon_path(element_db_name: String) -> String:
	return (_elements.get(element_db_name) as Dictionary).get("icon") as String

func get_elements_by_category(category: CategoryType) -> Array[String]:
	var elements: Array[String] = []
	for key: String in _elements.keys() as Array[String]:
		var element: Dictionary = _elements.get(key) as Dictionary
		if(element.get("category") == category):
			elements.push_back(key)
	return elements

func get_folklore_element_name(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("name") as String

func get_folklore_element_icon_path(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("icon") as String

func get_folklore_element_description(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("description") as String

func set_folklore_element_to_open(folklore_db_name: String) -> void:
	(_folklores[folklore_db_name])["state"] = "opened"

func get_folklore_element_name_by_sources(source_1: String, source_2: String) -> String:
	for key: String in _folklores.keys() as Array[String]:
		var folklore_dict: Dictionary = _folklores.get(key)
		var tmp_source_1: String = folklore_dict.get("source_1")
		var tmp_source_2: String = folklore_dict.get("source_2")
		if( source_1 == tmp_source_1 and source_2 == tmp_source_2
		or source_2 == tmp_source_1 and source_1 == tmp_source_2):
				return key
	return "invalid_sources"

func is_folklore_element_closed(folklore_db_name: String)->bool:
	var state: String = (_folklores.get(folklore_db_name) as Dictionary).get("state") as String
	if(state == "closed"):
		return true
	return false
