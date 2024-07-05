extends Node

signal category_opened(category: DBElements.CategoryType, is_right: bool)
signal category_closed(is_right: bool)
signal element_chosen(element_db_name: String ,is_right: bool)
