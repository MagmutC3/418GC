extends Control

var showing: bool = false
@onready var video_player = $AspectRatioContainer/Shadow
func _ready():
	add_to_group("PAUSE_MENU")

func toggle_menu(show: bool):
	if not show:
		show()

		get_tree().paused = true
		showing = true
		AudioManager.Music.enable_low_pass()
		video_player.stop()
		video_player.play()
	else:
		hide()
		get_tree().paused = false
		showing = false
		AudioManager.Music.disable_low_pass()
		video_player.stop()
		

func _on_resume_button_pressed() -> void:
	AudioManager.SFX.play_sfx("click")
	$CardControl/Card/ResumeButton.release_focus()
	toggle_menu(true)
	print("ok")


func _on_main_menu_button_pressed() -> void:
	# TODO: save the game here
	hide()
	get_tree().paused = false
	showing = false
	TransitionManager.change_scene("res://Scenes/MainMenu/MainMenu.tscn")
