extends Node

func effect(instance : Bullet) -> void:
	get_child(0).trigger_effect(instance)
