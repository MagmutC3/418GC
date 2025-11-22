extends Node2D

@export var entity: PackedScene
@export var quantity: int = 1

func _spawn() -> void:
	for i in range(quantity):
		var e = entity.instantiate()
		owner.add_child(e)
		e.global_position = self.global_position
