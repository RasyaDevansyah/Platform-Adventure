extends Node2D

@onready var animationPlayer : AnimationPlayer = $AnimationPlayer
@onready var animatedSprite2D : AnimatedSprite2D = $AnimatableBody2D/AnimatedSprite2D
@onready var timer : Timer = $Timer

func _on_trigger_box_body_entered(body):
	if body.is_in_group("Player"):
		if body.is_on_floor() and animationPlayer.current_animation != "Fall" and not animationPlayer.is_playing():
			animationPlayer.play("SteppedOn")
			if timer.is_stopped():
				timer.start()

func _on_timer_timeout():
	animatedSprite2D.play("Off")
	animationPlayer.play("Fall")
