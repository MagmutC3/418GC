extends Node2D

@export var entity: PackedScene
@export var quantity: int = 1
@export var max_instances: int = 30

var current_count: int = 0

func spawn_player() -> void:
	var e = entity.instantiate()
	owner.add_child(e)
	e.global_position = $".".global_position
		
func spawn_enemy() -> void:
	for i in range(quantity):
		if current_count >= max_instances:
			return  # do not spawn more
		
		var enemy_instance = entity.instantiate()
		enemy_instance.position = Vector2(randf() * 400, randf() * 300)
		
		# Optional: pass player reference
		var players = get_tree().get_nodes_in_group("PLAYER")
		if players.size() > 0:
			enemy_instance.player = players[0]
		
		add_child(enemy_instance)
		
		# Track instances
		current_count += 1

		# Connect signal to decrement count when enemy is removed
		enemy_instance.connect("tree_exited", Callable(self, "_on_enemy_removed"))
