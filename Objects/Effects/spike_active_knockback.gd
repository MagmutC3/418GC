extends Area2D

@export var strength : int = 3

func _physics_process(delta: float) -> void:
	pass
	#self.global_position = get_parent().get_parent().global_position

func on_enter(body):
	body.push = (body.global_position - global_position).normalized() * 1000 * strength
