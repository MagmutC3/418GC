extends Node2D

@onready var player_spawner: Node2D = $PlayerSpawner
@export var enemy_spawners = []
var respawning := false

func _ready():
	spawn()
	
func _physics_process(delta: float) -> void:
	if $Character.is_dead and not respawning:
		respawning = true
		for spawner in enemy_spawners:
			for child in get_node(spawner).get_children():
				child.queue_free()
		$Character.queue_free()
		await get_tree().process_frame
		
		spawn()
		
		respawning = false
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	for spawner in enemy_spawners:
		get_node(spawner).call_deferred("spawn_enemy")

func spawn():
	player_spawner.spawn_player()
	await get_tree().create_timer(1.5).timeout
	
	get_tree().call_group("MAIN_CHARACTER", "activate")
