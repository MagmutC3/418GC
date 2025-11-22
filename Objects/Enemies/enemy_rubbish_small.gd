extends Enemy

@onready var agent: NavigationAgent2D = $NavigationAgent2D
@onready var sprite: Sprite2D = $Sprite2D
var player: Node2D
func choose_variant():
	if randf() > 0.9:
		animated_sprite.play("bigguy")
	else:
		animated_sprite.play("default")
func _ready() -> void:
	# Find player through group
	choose_variant()
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
	velocity = direction * movementSpeed
	move_and_slide()

	# Rotate toward movement direction
	if velocity.length() > 1:
	# If moving left (negative X), flip the sprite
		if velocity.x < 0:
			sprite.flip_h = false
	# If moving right (positive X), un-flip it
		elif velocity.x > 0:
			sprite.flip_h = true
