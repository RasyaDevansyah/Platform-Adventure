extends Node2D

@onready var animated_sprite_2d : AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d : Area2D = $Area2D

var rng = RandomNumberGenerator.new()

func _ready():
	await get_tree().create_timer(rng.randf_range(0,0.3)).timeout
	animated_sprite_2d.play("default")

#dwaddwadwadwdwawd
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		animated_sprite_2d.play("pickedUp")
		area_2d.set_deferred("monitoring", false)
	



func _on_animated_sprite_2d_animation_finished():
	queue_free()
