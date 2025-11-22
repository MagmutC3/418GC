extends Area2D
class_name Bullet

var speed = 700
var damage = 1
var onHits = []
var onProcess = []

func _ready() -> void:
	ttl()

func _physics_process(delta):
	position += transform.x * speed * delta
	for effect in onProcess:
		effect.call(self)

func take_damage(hit, _instance : Bullet):
	hit.take_damage(damage)
	queue_free()

func ttl():
	await get_tree().create_timer(5).timeout
	queue_free()

func _on_Bullet_body_entered(hit):
	if hit.is_in_group("ENEMY"):
		hit.take_damage(damage)
		
		for effect in onHits:
			effect.call(hit, self)
	queue_free()
	#onHits.append(take_damage)
	#if hit.is_in_group("ENEMY"):
		#for effect in onHits:
				#effect.call(hit, self)
