class_name Transition
extends CanvasLayer

@onready var animation_player :  AnimationPlayer = $AnimationPlayer
@export var autoEnter : bool = true
const DELAY = 0.4
signal _TransitionFinished

func _ready():
	if autoEnter:
		await get_tree().create_timer(DELAY).timeout
		Enter()
	else:
		visible = true
	
func Enter():
	animation_player.play("Transition")
	
func Exit():
	GlobalScript.totalFruit = 0
	animation_player.play_backwards("Transition")

func _on_animation_player_animation_finished(_anim_name):
	
	emit_signal("_TransitionFinished")
