extends Control



var barrel_choice: int
var crosshair_choice: int
var attachement_choice: int
var stock_choice: int
var magazine_choice: int
var trigger_choice: int


func _on_return_button_pressed() -> void:
	AudioManager.SFX.play_sfx("click")
	
	print(barrel_choice, crosshair_choice, attachement_choice, stock_choice, magazine_choice, trigger_choice)
	
	TransitionManager.change_scene("res://Scenes/MainGame/MainGame.tscn")

func _on_barrel_choice_item_selected(index: int) -> void:
	barrel_choice = index


func _on_crosshair_choice_item_selected(index: int) -> void:
	crosshair_choice = index


func _on_attachement_choice_item_selected(index: int) -> void:
	attachement_choice = index


func _on_stock_choice_item_selected(index: int) -> void:
	stock_choice = index


func _on_magazine_choice_item_selected(index: int) -> void:
	magazine_choice = index


func _on_trigger_choice_item_selected(index: int) -> void:
	trigger_choice = index
