extends Area2D
class_name Bullet

var speed = 700
var damage = 1
var onHits = []

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(hit):
	#if hit.is_in_group("mobs"):
		#hit.take_damage(damage)
		#for effect in onHits:
			#call(effect)
	for effect in onHits:
		effect.call(hit)
	queue_free()
