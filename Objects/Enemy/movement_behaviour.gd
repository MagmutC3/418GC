extends Node

@onready var enemy = $".."

@onready var player = $"../../Character"

var speed = 200

var chasing = true

func _physics_process(_delta):
	if chasing and player and enemy:
		var direction = (player.global_position - enemy.global_position).normalized()
		enemy.velocity = direction * speed
		
		if enemy.velocity > Vector2(0,0):
			enemy.move_and_slide()
		
	else:
		return


func enable():
	chasing = true
