extends Node

signal hints_updated
signal hints_empty
signal hidden_elements_changed

const ELEMENTS_JSON = "res://elements.json" #список всех элементов
const ELEMENTS_SAVE_PATH = "res://saves/folklore.save" #путь до сейва открытых элементов
const HINT_SAVE_PATH = "res://saves/hint.save" #путь до сейва подсказок

var category_name: String = "empty"

var available_hints: int = 3

var all_elements = {}

var actual_element_category = {}
var open_elements = [
	"test1",
	"test2",
]

func _ready() -> void:
	print("Global загружен.")
	load_elements_from_json()
	load_open_elements()
	load_available_hints()
	upgrade_actual_elements_category()
	print("-------------")

func load_elements_from_json():
	var file = FileAccess.open(ELEMENTS_JSON, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	all_elements = data
	print("-- Всего элементов: %s" % all_elements.keys().size())
	print("-------------")

func upgrade_actual_elements_category():
	actual_element_category["Во всех категориях"] = all_elements.size()
	for key in all_elements.keys():
		for cat in all_elements[key]["categories"]:
			if cat not in actual_element_category:
				actual_element_category[cat] = 1
			else:
				actual_element_category[cat] += 1
	print("Список категорий")
	for key in actual_element_category:
		print(key + " :  " + str(actual_element_category[key]))
	print("-------------")

func save_open_elements():
	var file = FileAccess.open(ELEMENTS_SAVE_PATH, FileAccess.WRITE)
	file.store_var(open_elements)
	print("Статус открытых элементов сохранен")

func load_open_elements():
	print("Загрузка открытых элементов:")
	if FileAccess.file_exists(ELEMENTS_SAVE_PATH):
		print("Сейв найден")
		var file = FileAccess.open(ELEMENTS_SAVE_PATH, FileAccess.READ)
		open_elements = file.get_var()
		for el in open_elements:
			if el not in all_elements.keys():
				open_elements.erase(el)
		print("-- Открытые элементы: %s" % open_elements.size())
	else:
		Global.print_info("Сейв файл не найден")

func save_available_hints():
	var file = FileAccess.open(HINT_SAVE_PATH, FileAccess.WRITE)
	file.store_var(available_hints)
	print("Счет доступных подсказок сохранен.")

func load_available_hints():
	print("Загрузка доступных подсказок")
	if FileAccess.file_exists(HINT_SAVE_PATH):
		print("Файл подсказок найден")
		var file = FileAccess.open(HINT_SAVE_PATH, FileAccess.READ)
		available_hints = file.get_var()
		print("-- Счетчик подсказок %s" % available_hints)
	else:
		Global.print_info("Файл подсказок не найден")
		print("-------------")

func print_info(info_text: String):
	print("Game Elements: " + info_text)
