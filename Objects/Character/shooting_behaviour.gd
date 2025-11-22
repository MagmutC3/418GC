extends Node

@export var bullet : PackedScene

func _process(_delta) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var b = bullet.instantiate()
	
	owner.add_sibling(b)
	b.global_transform = get_node("../BulletSpawnPoint").global_transform
	
	get_node("../Weapon").shoot(b)
