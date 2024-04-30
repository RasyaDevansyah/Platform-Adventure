extends Control

@onready var transition : CanvasLayer = $Transition
var levelChoosen : int = -1


func _on_button_1_button_up():
	if levelChoosen != -1:
		return
	levelChoosen = 1
	await get_tree().create_timer(0.4).timeout
	transition.Exit()


func _on_back_button_down():
	if levelChoosen != -1:
		return
	levelChoosen = 0
	await get_tree().create_timer(0.4).timeout
	transition.Exit()
	
func _on_canvas_layer__transition_finished():
	match levelChoosen:
		0:
			get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
		1:
			get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
			
