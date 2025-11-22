extends CharacterBody2D

var max_health: int = 100
var current_health = max_health

var is_dead: bool = false
var taking_damage = false
var damage_timer = 0
var is_flashing = false
var flashing_time = 0.2
var damage_time = 0.5

func _ready() -> void:
	add_to_group("PLAYER")

func activate():
	$MovementBehaviour.enable()

func _process(_delta):
	if !is_dead:
		look_at(get_global_mouse_position())
		if taking_damage:
			damage_timer -= _delta
			if damage_timer <= damage_time-flashing_time:
				is_flashing = false
			if damage_timer <= 0:
				taking_damage = false

func take_damage(damage: int):
	if is_dead:
		return
	if !taking_damage:
		current_health -= damage
		damage_timer = damage_time
		taking_damage = true
		is_flashing = true

		if current_health <= 0:
			die()

func die():
	is_dead = true
	$MovementBehaviour.disable()
	print("PLAYER DIED")
	
