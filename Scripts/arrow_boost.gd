extends Node2D

@onready var animatedSprite2D : AnimatedSprite2D = $AnimatedSprite2D
@export var launchPower : float = 500
@export var oneShot : bool = true

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		var dir = global_transform.basis_xform(Vector2.UP)
		var player : CharacterBody2D = body
		player.velocity = dir * launchPower
		animatedSprite2D.play("Hit")
		


func _on_animated_sprite_2d_animation_finished():
	if oneShot:
		queue_free()
		return
	else:
		animatedSprite2D.play("Idle")
