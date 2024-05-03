extends Node2D

@onready var animationPlayer : AnimationPlayer = $AnimationPlayer
@onready var chain : Line2D = $Joint/Chain
@onready var joint : AnimatableBody2D = $Joint
@onready var spike_ball : Area2D= $Joint/SpikeBall

@export var startBackwards : bool = false
@export_range (0.0,1.4, 0.001) var startAtTime : float = 0.0

func _ready():
	chain.clear_points()
	chain.add_point(to_local(joint.global_position))
	chain.add_point(to_local(spike_ball.global_position))
	if startBackwards:
		animationPlayer.play_backwards("BallRotate")
	else:
		animationPlayer.play("BallRotate")
	animationPlayer.advance(startAtTime)
