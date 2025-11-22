extends CharacterBody2D
class_name Enemy

@export var max_health : float = 100
@export var current_health = max_health

@export var movementSpeed : float = 200
@export_range(0,1,0.01) var dropChance : float
@export var loot : PackedScene

@onready var rng = RandomNumberGenerator.new()

var dotDuration : Timer
var dotTimer : Timer

func _ready() -> void:
	rng.randomize()
	dotDuration = Timer.new()
	dotTimer = Timer.new()
	add_child(dotDuration)
	add_child(dotTimer)
	dotDuration.one_shot = true
	dotTimer.one_shot = true
	dotTimer.timeout.connect(dot)

func dot():
	take_damage(health*0.05)
	
	if dotDuration.wait_time > 0:
		dotTimer.start(1)

func take_damage(damage : float) -> void:
	current_health -= damage
	die()

func apply_dot(time : int):
	dotDuration.start(time)
	dotTimer.start(1)
	pass
	

func die() -> void:
	if current_health <= 0:
		var drop = rng.randf_range(0,1)
		if drop <= dropChance:
			#INITIALIZE LOOT HERE
			pass
		self.queue_free()
