extends CharacterBody2D

func _ready() -> void:
	add_to_group("PLAYER")

func activate():
	$MovementBehaviour.enable()

func _process(_delta):
	look_at(get_global_mouse_position())
