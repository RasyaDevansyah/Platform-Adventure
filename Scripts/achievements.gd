extends Control

@onready var transition : CanvasLayer = $Transition
var levelChoosen : int = -1


func _on_back_button_up():
	await get_tree().create_timer(0.4).timeout
	levelChoosen = 1
	transition.Exit()


func _on_transition__transition_finished():
	if levelChoosen == 1:
		get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
