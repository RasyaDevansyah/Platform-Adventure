extends CanvasLayer

@onready var transition = $"../Transition" as Transition
@onready var winAnimation : AnimationPlayer = $WinAnimation

var sceneNumber = -1

func _on_restart_button_up():
	transition.Exit()
	sceneNumber = 0
	pass

func _on_level_select_button_up():
	transition.Exit()
	sceneNumber = 1
	pass

func _on_next_button_up():
	transition.Exit()
	sceneNumber = 2
	pass


func _on_transition__transition_finished():
	match sceneNumber:
		0:
			get_tree().reload_current_scene()
			pass
		1:
			get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
			pass
		2:
			get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
			pass
		
	pass 

func _on_trophy__level_complete():
	winAnimation.play("Win")
	pass 

func _on_pulu_pulu_guy__player_death():
	await get_tree().create_timer(0.7).timeout
	_on_restart_button_up()
