extends Node

signal category_opened(category: DBElements.CategoryType, is_right: bool)
signal category_closed(is_right: bool)
signal element_chosen(element_db_name: String ,is_right: bool)
signal merged(folklore_db_name: String)
signal merge_failed()
signal popup_closed()
signal right_element(element_db_name: String)
signal left_element(element_db_name: String)
signal spawn_popup(folkore_bd_name: String)
signal failed_merge_elements(_left_element_selected: String, _right_element_selected: String)
