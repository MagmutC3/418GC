extends Area2D

@onready var button: Button = $Button
@onready var label: Label = $Label


func _on_body_entered(body: Node2D) -> void:
	button.show()
	label.hide()
	$AnimatedSprite2D.frame = 1


func _on_body_exited(body: Node2D) -> void:
	button.hide()
	label.show()
	$AnimatedSprite2D.frame = 0
	

func _on_button_pressed() -> void:
	#pass # TODO: display workshop scene
	TransitionManager.change_scene("res://Scenes/WorkshopScene/WorkshopScene.tscn")
