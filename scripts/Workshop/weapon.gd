extends Node


func shoot(instance : Bullet) -> void:
	for attachment in get_children():
		attachment.effect(instance)
