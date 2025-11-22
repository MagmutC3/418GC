extends Area2D
class_name Bullet

var speed = 700
var damage = 1
var onHits = []
var onProcess = []


func _physics_process(delta):
	position += transform.x * speed * delta
	for effect in onProcess:
		effect.call(self)

func take_damage(hit, _instance : Bullet):
	hit.take_damage(damage) 
	queue_free()

func _on_Bullet_body_entered(hit):
	onHits.append(take_damage)
	if hit.is_in_group("ENEMY"):
		for effect in onHits:
			effect.call(hit, self)
