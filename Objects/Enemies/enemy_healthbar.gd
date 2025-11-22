extends ProgressBar

var enemy: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if not enemy:
		enemy = $".."
		value = 1
		return
	value = enemy.current_health * 100 / enemy.max_health
	
