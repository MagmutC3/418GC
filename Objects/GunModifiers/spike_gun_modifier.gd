extends GunModifier

@onready var activeEffects = $"../../../ActiveEffects"

#This is a modifier template script
#if the effect is active/constant (ex. aura, cursor effect)

#on shoot effect
	#add functionality directly in the effect function

#on hit effect
	#add a callable to Bullet's instance onHits array

#constant effect
	#add child to activeEffects if it's not already there

#bullet effect
	#add child to Bullet's instance

@export var scopeEffect : PackedScene
func scope_effect(_instance : Bullet):
	var e = scopeEffect.instantiate()
	add_child(e)
	e.global_transform = _instance.global_transform
	pass


func barrel_effect(_instance : Bullet):
	_instance.speed = 1
	_instance.apply_scale(Vector2(3,3))
	pass

@export var attachmentEffect : PackedScene
var attachmentEffectAdded : bool = false
func attachment_effect(_instance : Bullet):
	if not attachmentEffectAdded:
		var e = attachmentEffect.instantiate()
		activeEffects.add_child(e)
		e.position = Vector2(0,0)
		attachmentEffectAdded = true
		
func stock_effect(_instance : Bullet):
	var e = scopeEffect.instantiate()
	add_child(e)
	e.global_transform = _instance.global_transform
	e.rotation += PI 
	pass
	
func magazineEffect(hit, _instance : Bullet):
	if hit.health <= 0:
		var e = _instance.duplicate()
		_instance.add_sibling(e)
		e.speed = _instance.speed
		e.onHits = _instance.onHits
		e.damage = _instance.damage
		e.onProcess = _instance.onProcess

func magazine_effect(_instance : Bullet):
	_instance.onHits.append(magazineEffect)
	pass

func triggerEffect(hit, _instance : Bullet):
	hit.apply_dot(2)

func trigger_effect(_instance : Bullet):
	_instance.onHits.append(triggerEffect)
