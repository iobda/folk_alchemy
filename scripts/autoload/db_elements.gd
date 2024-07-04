extends Node

enum Category {ANIMALS = 0, HUMAN = 1, NATURAL_DISASTERS = 2, EMOTIONS = 3, FOLKLORE = 4}

var categories: Dictionary = {
	Category.ANIMALS: "Животные",
	Category.HUMAN: "Человек",
	Category.NATURAL_DISASTERS: "Стихийные бедствия",
	Category.EMOTIONS: "Эмоции"
}

var elements: Dictionary = {
	"cat": {
		"name": "Кошка",
		"source_1": null,
		"source_2": null,
		"icon": "res://assets/element-icons/cat.png",
		"category" : Category.ANIMALS
	},
	"love": {
		"name": "Любовь",
		"source_1": null,
		"source_2": null,
		"icon": "res://assets/element-icons/love.png",
		"category" : Category.EMOTIONS
	}
}

var folklores: Dictionary ={
	"bastet": {
		"name": "Бастет",
		"source_1": "cat",
		"source_2": "love",
		"icon": "res://assets/folklore/bastet.png",
		"category": Category.FOLKLORE,
		"description": "Лорем ипсум пси пси спим",
		"state": "closed"
	}
}

var base_elements_by_category: Dictionary = {
	Category.EMOTIONS: {
		"love": {
		"name": "Любовь",
		"icon": "res://assets/element-icons/love.png",
		}
	},
	Category.ANIMALS: {
		"cat": {
			"name": "Кошка",
			"icon": "res://assets/element-icons/cat.png",
		}
	}
}
