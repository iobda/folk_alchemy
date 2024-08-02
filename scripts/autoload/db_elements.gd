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
	},
	"soul": {
		"name": "Душа",
		"icon": "res://assets/element-icons/soul.png",
		"category" : CategoryType.HUMAN
	},
	"hope": {
		"name": "Надежда",
		"icon": "res://assets/element-icons/hope.png",
		"category" : CategoryType.EMOTIONS
	},
	"eruption": {
		"name": "Извержение вулкана / Огонь",
		"icon": "res://assets/element-icons/eruption.png",
		"category" : CategoryType.NATURAL_DISASTERS
	},
	"tornado": {
		"name": "Ураган / Ветер",
		"icon": "res://assets/element-icons/tornado.png",
		"category" : CategoryType.NATURAL_DISASTERS
	},
	"fear": {
		"name": "Страх",
		"icon": "res://assets/element-icons/fear.png",
		"category" : CategoryType.EMOTIONS
	},
	"bat": {
		"name": "Летучая мышь",
		"icon": "res://assets/element-icons/bat.png",
		"category" : CategoryType.ANIMALS
	},
	"blood": {
		"name": "Кровь",
		"icon": "res://assets/element-icons/blood.png",
		"category" : CategoryType.HUMAN
	},
	"earthquake": {
		"name": "Землетрясение",
		"icon": "res://assets/element-icons/earthquake.png",
		"category" : CategoryType.NATURAL_DISASTERS
	},
	"eyes": {
		"name": "Глаза",
		"icon": "res://assets/element-icons/eyes.png",
		"category" : CategoryType.HUMAN
	},
	"fox": {
		"name": "Лиса",
		"icon": "res://assets/element-icons/fox.png",
		"category" : CategoryType.ANIMALS
	},
	"hatred": {
		"name": "Ненависть",
		"icon": "res://assets/element-icons/hatred.png",
		"category" : CategoryType.HUMAN
	},
	"sadness": {
		"name": "Печаль",
		"icon": "res://assets/element-icons/sadness.png",
		"category" : CategoryType.EMOTIONS
	},
	"sea": {
		"name": "Море / Вода",
		"icon": "res://assets/element-icons/sea.png",
		"category" : CategoryType.NATURAL_DISASTERS
	},
	"snake": {
		"name": "Змея",
		"icon": "res://assets/element-icons/snake.png",
		"category" : CategoryType.ANIMALS
	},
	"wolf": {
		"name": "Волк",
		"icon": "res://assets/element-icons/wolf.png",
		"category" : CategoryType.ANIMALS
	},
	"voice": {
		"name": "Голос",
		"icon": "res://assets/element-icons/voice.png",
		"category" : CategoryType.HUMAN
	}
}

var _folklores: Dictionary ={
	"bastet": {
		"name": "Бастет",
		"icon": "res://assets/folklore/bastet.png",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"source_1": "cat",
		"source_2": "love",
		"state": "closed"
	},
	"succubus": {
		"name": "Суккуб",
		"icon": "res://assets/folklore/succubus.png",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"source_1": "soul",
		"source_2": "love",
		"state": "closed"
	},
	"phoenix": {
		"name": "Феникс",
		"icon": "res://assets/folklore/phoenix.png",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"source_1": "hope",
		"source_2": "eruption",
		"state": "closed"
	},
	"harpy": {
		"name": "Гарпия",
		"icon": "res://assets/folklore/harpy.png",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"source_1": "fear",
		"source_2": "tornado",
		"state": "closed"
	},
	"banshi": {
		"name": "Банши",
		"icon": "res://assets/folklore/banshi.png",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"source_1": "voice",
		"source_2": "sadness",
		"state": "closed"
	},
	"gorgon": {
		"name": "Медуза Горгона",
		"icon": "res://assets/folklore/gorgon.png",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"source_1": "snake",
		"source_2": "eyes",
		"state": "closed"
	},
	"ifrit": {
		"name": "Ифрит",
		"icon": "res://assets/folklore/ifrit.png",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"source_1": "eruption",
		"source_2": "hatred",
		"state": "closed"
	},
	"siren": {
		"name": "Сирена",
		"icon": "res://assets/folklore/siren.png",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"source_1": "voice",
		"source_2": "snake",
		"state": "closed"
	},
	"vampire_cat": {
		"name": "Кот-Вампир",
		"icon": "res://assets/folklore/vampir_cat.png",
		"description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		"source_1": "cat",
		"source_2": "bat",
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

func get_element_category(element_db_name: String) -> CategoryType:
	return (_elements.get(element_db_name) as Dictionary).get("category") as CategoryType

func get_elements_by_category(category: CategoryType) -> Array[String]:
	var elements: Array[String] = []
	for key: String in _elements.keys() as Array[String]:
		var element: Dictionary = _elements.get(key) as Dictionary
		if(element.get("category") == category):
			elements.push_back(key)
	return elements

func get_folklores_elements_bd_names() -> Array[String]:
	var bd_names: Array[String] = []
	for key: String in _folklores.keys() as Array[String]:
		bd_names.push_back(key)
	return bd_names

func get_folklores_elements_sources(folklore_db_name: String) -> Array[String]:
	var sources: Array[String] = []
	sources.push_back((_folklores.get(folklore_db_name) as Dictionary).get("source_1"))
	sources.push_back((_folklores.get(folklore_db_name) as Dictionary).get("source_2"))
	return sources

func get_folklore_element_name(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("name") as String

func get_folklore_element_icon_path(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("icon") as String

func get_folklore_element_description(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("description") as String

## If element opened then return "opened"
## else return "closed"
func get_folklore_state(folklore_db_name: String) -> String:
	return (_folklores.get(folklore_db_name) as Dictionary).get("state")

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
