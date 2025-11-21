extends Control


func _on_reset_button_pressed() -> void:
	pass # TODO: implement save wipe
	TransitionManager.change_scene("res://Scenes/MainMenu/MainMenu.tscn")

func _on_cancel_button_pressed() -> void:
	TransitionManager.change_scene("res://Scenes/MainMenu/MainMenu.tscn")
