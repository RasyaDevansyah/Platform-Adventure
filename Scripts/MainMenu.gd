extends Control

@onready var canvas_layer : CanvasLayer = $CanvasLayer

enum pressed {NULL, PLAY, EXIT}
var state : pressed = pressed.NULL

func _on_quit_button_up():
	if state != pressed.NULL:
		return
	state = pressed.EXIT
	await get_tree().create_timer(0.4).timeout
	canvas_layer.Exit()


func _on_play_button_up():
	if state != pressed.NULL:
		return
	state = pressed.PLAY
	await get_tree().create_timer(0.4).timeout
	canvas_layer.Exit()

	pass # Replace with function body.


func _on_canvas_layer__transition_finished():
	if state == pressed.PLAY:
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	elif state == pressed.EXIT:
		get_tree().quit()
