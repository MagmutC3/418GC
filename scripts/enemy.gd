extends CharacterBody2D
class_name Enemy

@export var health : float = 100
@export var movementSpeed : float = 100
@export_range(0,1,0.01) var dropChance : float

@onready var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()

func take_damage(amount : float) -> void:
	health -= amount
	die()

func die() -> void:
	if health <= 0:
		var drop = rng.randf_range(0,1)
		if drop <= dropChance:
			#INITIALIZE LOOT HERE
			pass
		self.queue_free()
