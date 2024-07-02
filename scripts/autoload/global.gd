extends Node

const ELEMENTS_JSON = "res://resources/elements.json"#list of all elements
const ELEMENTS_SAVE_PATH = "res://saves/folklore.save" #save file path


var available_hints: int = 3 #hint counter
var all_elements = {} #elements
var actual_item_groups = {} #categories
var open_elements = [ #start elements from JSON
	"cat",
	"bat",
]

func _ready() -> void: 
	print("-------Global loaded-------")
	load_elements_from_json()
	load_open_elements()
	upgrade_actual_item_groups()
	print("---------------------------")

func load_elements_from_json(): #JSON autoload
	var file = FileAccess.open(ELEMENTS_JSON, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	all_elements = data
	print("- All elements counter: %s" % all_elements.keys().size(), " -")
	print("---------------------------")

func upgrade_actual_item_groups():
	actual_item_groups["all_categories"] = all_elements.size()
	for key in all_elements.keys():
		for cat in all_elements[key]["categories"]:
			if cat not in actual_item_groups:
				actual_item_groups[cat] = 1
			else:
				actual_item_groups[cat] += 1
	print("Actual elements groups list:")
	for key in actual_item_groups:
		print(key + " :  " + str(actual_item_groups[key]))

func save_open_elements(): #Save open elements
	var file = FileAccess.open(ELEMENTS_SAVE_PATH, FileAccess.WRITE)
	file.store_var(open_elements)
	print("Open elements status saved")

func load_open_elements(): #Load open elements
	print("---Loading open elements---")
	if FileAccess.file_exists(ELEMENTS_SAVE_PATH):
		print("------Save file found------")
		var file = FileAccess.open(ELEMENTS_SAVE_PATH, FileAccess.READ)
		open_elements = file.get_var()
		for el in open_elements:
			if el not in all_elements.keys():
				open_elements.erase(el)
		print("-- Opened elements: %s" % open_elements.size(), " --")
	else:
		print("----Save file not found----")
