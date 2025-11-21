@abstract
extends Node
class_name GunModifier

@abstract func scope_effect(instance : Bullet) -> Callable
@abstract func barrel_effect(instance : Bullet) -> Callable
@abstract func attachment_effect(instance : Bullet) -> Callable
@abstract func butt_effect(instance : Bullet) -> Callable
@abstract func magazine_effect(instance : Bullet) -> Callable
@abstract func trigger_effect(instance : Bullet) -> Callable
