extends Enemy

@onready var agent: NavigationAgent2D = $NavigationAgent2D
@onready var sprite: AnimatedSprite2D = $Sprite2D
var player: Node2D
var push: Vector2 = Vector2(0,0)

func _ready() -> void:
	super()
	sprite.play("default")
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
	if push:
		velocity = push
		push = Vector2(0,0)
	else:
		velocity += direction * movementSpeed
	move_and_slide()

	velocity *= 0.7

	# Rotate toward movement direction
	if velocity.length() > 1:
	# If moving left (negative X), flip the sprite
		if velocity.x < 0:
			sprite.flip_h = false
	# If moving right (positive X), un-flip it
		elif velocity.x > 0:
			sprite.flip_h = true
