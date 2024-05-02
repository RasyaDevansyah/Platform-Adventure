extends Node2D

@onready var animationPlayer : AnimationPlayer = $AnimationPlayer
@onready var fireDuration : Timer = $fireDuration


func _on_trigger_box_body_entered(body):
	if body.is_in_group("Player"):
		animationPlayer.play("Triggered")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Triggered":
		await get_tree().create_timer(0.5).timeout
		animationPlayer.play("On")
		fireDuration.start()
		

func _on_fire_duration_timeout():
	animationPlayer.play("Off")
	pass # Replace with function body.
