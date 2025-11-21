extends Control


func _input(event):
	if visible and Input.is_action_just_pressed("ui_accept"):
		_on_start_button_pressed()

func _on_start_button_pressed():
	AudioManager.SFX.play_sfx("click")
	AudioManager.Music.fade_in()
	AudioManager.Music.play_main_theme()
	
	TransitionManager.change_scene("res://Scenes/MainGame/MainGame.tscn")


func _on_reset_save_button_pressed() -> void:
	AudioManager.SFX.play_sfx("click")
	TransitionManager.change_scene("res://Scenes/ResetSave/ResetSave.tscn")


func _on_exit_button_pressed() -> void:
	AudioManager.SFX.play_sfx("click")
	get_tree().quit()
