extends ProgressBar

var character: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(character)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if not character:
		character = $"../../Character"
		value = 1
		return
	value = character.current_health * 100 / character.max_health
	
