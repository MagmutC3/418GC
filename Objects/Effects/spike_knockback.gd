extends ShapeCast2D

@export var strength : int = 10

func _physics_process(delta: float) -> void:
	force_shapecast_update()
	for i in range(get_collision_count()):
		get_collider(i).push = (get_collider(i).global_position - global_position).normalized() * 1000 * strength
		print(get_collider(i).push)

	queue_free()
