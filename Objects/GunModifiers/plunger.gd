extends GunModifier

#This is a modifier template script
#if the effect is active/constant (ex. aura, cursor effect)

#on shoot effect
	#add functionality directly in the effect function

#on hit effect
	#add a callable to Bullet's onHits array
	#
#constant effect

func on_hit_example():
	print("hit")

func scope_effect(instance : Bullet):
	instance.speed += 1000
	instance.onHits.append(on_hit_example)
	pass

func barrel_effect(instance : Bullet):
	pass

func attachment_effect(instance : Bullet):
	pass

func butt_effect(instance : Bullet):
	pass

func magazine_effect(instance : Bullet):
	pass

func trigger_effect(instance : Bullet):
	pass
