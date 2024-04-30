extends Node

@onready var transition : CanvasLayer = $Transition
@onready var credits = $Credits
@onready var menu = $Menu

enum pressed {NULL, PLAY, EXIT}
var state : pressed = pressed.NULL

func _on_quit_button_up():
	if state != pressed.NULL:
		return
	state = pressed.EXIT
	await get_tree().create_timer(0.4).timeout
	transition.Exit()


func _on_play_button_up():
	if state != pressed.NULL:
		return
	state = pressed.PLAY
	await get_tree().create_timer(0.4).timeout
	transition.Exit()

	pass # Replace with function body.


func _on_canvas_layer__transition_finished():
	if state == pressed.PLAY:
		get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
	elif state == pressed.EXIT:
		get_tree().quit()


func _on_credits_button_up():
	credits.visible = true
	menu.visible = false

func _on_back_button_up():
	credits.visible = false
	menu.visible = true
