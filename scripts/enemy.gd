extends CharacterBody2D
class_name Enemy

@export var max_health : float = 100
@export var current_health = max_health

@export var movementSpeed : float = 200
@export_range(0,1,0.01) var dropChance : float
@export var loot : PackedScene

@onready var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()

func take_damage(damage : float) -> void:
	current_health -= damage
	die()

func die() -> void:
	if current_health <= 0:
		var drop = rng.randf_range(0,1)
		if drop <= dropChance:
			#INITIALIZE LOOT HERE
			pass
		self.queue_free()
