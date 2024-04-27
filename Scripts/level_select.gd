extends Control

@onready var canvas_layer : CanvasLayer = $CanvasLayer

var levelChoosen : int = -1

func _on_button_1_button_up():
	if levelChoosen != -1:
		return
	levelChoosen = 1
	await get_tree().create_timer(0.4).timeout
	canvas_layer.Exit()


func _on_back_button_down():
	if levelChoosen != -1:
		return
	levelChoosen = 0
	await get_tree().create_timer(0.4).timeout
	canvas_layer.Exit()
	
func _on_canvas_layer__transition_finished():
	if levelChoosen == 0:
		get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	elif levelChoosen == 1:
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	pass
