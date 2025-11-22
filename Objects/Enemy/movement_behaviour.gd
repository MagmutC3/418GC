extends CharacterBody2D

@export var speed: float = 200

@onready var agent: NavigationAgent2D = $NavigationAgent2D
var player: Node2D

func _ready() -> void:
	# Find player through group
	var players = get_tree().get_nodes_in_group("PLAYER")
	if players.size() > 0:
		player = players[0]
	else:
		push_error("Player node not found in the scene tree!")
		return
	
	# Set initial target
	agent.target_position = player.global_position

func _physics_process(delta: float) -> void:
	if not player:
		return
	
	# Continuously update the path toward the player's position
	agent.target_position = player.global_position

	# Calculate next path point
	var next_point: Vector2 = agent.get_next_path_position()
	
	# Direction to the next path waypoint
	var direction: Vector2 = (next_point - global_position).normalized()
	
	# Movement
	velocity = direction * speed
	move_and_slide()

	# Rotate toward movement direction
	if velocity.length() > 1:
		rotation = velocity.angle()
