extends CharacterBody2D

func activate():
	$MovementBehaviour.enable()

func _process(_delta):
	look_at(get_global_mouse_position())
