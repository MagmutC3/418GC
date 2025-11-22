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

func scopeEffect(_instance : Bullet):
	_instance.look_at(get_global_mouse_position())

func scope_effect(_instance : Bullet):
	#_instance.onProcess.append(scopeEffect)
	pass

func barrel_effect(_instance : Bullet):
	var e = _instance.duplicate()
	_instance.add_sibling(e)
	e.global_rotation += 10.0/180*PI
	e.speed = _instance.speed
	e.onHits = _instance.onHits
	pass

func attachment_effect(_instance : Bullet):
	var e = _instance.duplicate()
	_instance.add_sibling(e)
	e.global_rotation -= 10.0/180*PI
	e.speed = _instance.speed
	e.onHits = _instance.onHits
	pass

func stock_effect(_instance : Bullet):
	var e = _instance.duplicate()
	_instance.add_sibling(e)
	e.global_rotation += PI
	e.speed = _instance.speed
	e.onHits = _instance.onHits
	pass

func magazine_effect(_instance : Bullet):
	_instance.damage *= 2
	pass

func trigger_effect(_instance : Bullet):
	for i in range(8):
		var e = _instance.duplicate()
		_instance.add_sibling(e)
		e.global_rotation += 2.0 * i / 7 * PI
		e.speed = _instance.speed
		e.onHits = _instance.onHits
	pass
