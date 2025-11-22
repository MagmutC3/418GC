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
	
	var eq1 = TransitionManager.selectedLoadout[0].instantiate()
	var eq2 = TransitionManager.selectedLoadout[1].instantiate()
	var eq3 = TransitionManager.selectedLoadout[2].instantiate()
	var eq4 = TransitionManager.selectedLoadout[3].instantiate()
	var eq5 = TransitionManager.selectedLoadout[4].instantiate()
	var eq6 = TransitionManager.selectedLoadout[5].instantiate()
	
	$"../Character/Weapon/Barrel".add_child(eq1)
	$"../Character/Weapon/Scope".add_child(eq2)
	$"../Character/Weapon/Attachment".add_child(eq3)
	$"../Character/Weapon/Stock".add_child(eq4)
	$"../Character/Weapon/Magazine".add_child(eq5)
	$"../Character/Weapon/Trigger".add_child(eq6)

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
