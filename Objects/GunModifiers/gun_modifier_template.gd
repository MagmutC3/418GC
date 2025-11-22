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

func on_hit_example(hit):
	print(hit)

func scope_effect(_instance : Bullet):
	#this is an example of a instant effect
	_instance.speed += 1000
	pass

func barrel_effect(_instance : Bullet):
	#this is an example of an on hit effect
	_instance.onHits.append(on_hit_example)
	pass

func attachment_effect(_instance : Bullet):
	#this is an example of a bullet effect
	var e = _instance.duplicate()
	_instance.add_sibling(e)
	e.global_rotation += 10.0/360*PI
	e.speed = _instance.speed
	e.onHits = _instance.onHits
	pass

var constantEffectAdded = false
@export var effect : PackedScene
func stock_effect(_instance : Bullet):
	#this is an example of a constant effect
	if not constantEffectAdded:
		var e = effect.instantiate()
		activeEffects.add_child(e)
		constantEffectAdded = true
	pass

func magazine_effect(_instance : Bullet):
	pass

func trigger_effect(_instance : Bullet):
	pass
