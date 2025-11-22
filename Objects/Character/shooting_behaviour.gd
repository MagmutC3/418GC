extends Node

@export var bullet : PackedScene
@onready var character: CharacterBody2D = $".."

func _process(_delta) -> void:
	if Input.is_action_just_pressed("shoot") && !character.is_dead:
		shoot()

func shoot():
	var b = bullet.instantiate()
	
	$"../Bullets".add_child(b)
	b.global_transform = get_node("../BulletSpawnPoint").global_transform
	
	get_node("../Weapon").shoot(b)
