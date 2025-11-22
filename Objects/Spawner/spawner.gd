extends Node2D

@export var entity = []
@export var quantity: int = 1
@export var max_instances: int = 10

@onready var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()

func spawn_player() -> void:
	var e = entity[0].instantiate()
	owner.add_child(e)
	e.global_position = self.global_position
		
func spawn_enemy() -> void:
	for i in range(quantity):
		var type : float = rng.randf_range(0,1)
		var enemy_instance = null
		if type <= 0.3:
			enemy_instance = entity[1].instantiate()
		else:
			enemy_instance = entity[0].instantiate()
		
		if self.get_child_count() >= max_instances:
			return  # do not spawn more
		add_child(enemy_instance)
		
		enemy_instance.position = Vector2(randf() * 400, randf() * 300)
		
		# Connect signal to decrement count when enemy is removed
		enemy_instance.connect("tree_exited", Callable(self, "_on_enemy_removed"))
