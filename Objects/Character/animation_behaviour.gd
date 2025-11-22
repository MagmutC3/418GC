extends Node

@onready var Character = $".."

var isBarking = false

var flash_time := 1
var flash_timer := 0.0
var is_flashing := false

const THRESHOLD_SPEED = 10

func _ready():
	%CharacterSprite.play("sit")

func _physics_process(_delta):
	update_animation()

func update_animation():
	if %MovementBehaviour.disabled:
		%CharacterSprite.play("idle")
		return
	
	else:
		if Character.is_flashing:
			%CharacterSprite.modulate = Color(1,0,0)

		else:
			%CharacterSprite.modulate = Color(1,1,1)
			
		if Character.velocity != Vector2.ZERO:
			if isBarking: %CharacterSprite.play("bark_run")
			else: %CharacterSprite.play("run")
		else:
			if isBarking: %CharacterSprite.play("bark_idle")
			else: %CharacterSprite.play("idle")
