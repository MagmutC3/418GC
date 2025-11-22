extends Node2D

@onready var player_spawner: Node2D = $PlayerSpawner
@onready var enemy_spawner: Node2D = $EnemySpawner


func _ready():
	player_spawner.spawn_player()
	await get_tree().create_timer(1.5).timeout
	# this is just to demonstrate the usage of groups
	# in this specific case we can access the child node Fox,
	# but often there are cases when it's not a child/parent
	# but a sibling that could even be in another subscene
	get_tree().call_group("MAIN_CHARACTER", "activate")

func _on_area_2d_body_entered(body: Node2D) -> void:
	enemy_spawner.call_deferred("spawn_enemy")
