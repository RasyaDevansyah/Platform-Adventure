extends Control

@onready var transition : CanvasLayer = $Transition
var levelChoosen : int = -1

func _on_back_button_down():
	if levelChoosen != -1:
		return
	levelChoosen = 0
	await get_tree().create_timer(0.4).timeout
	transition.Exit()

func _on_achievements_button_up():
	if levelChoosen != -1:
		return
	levelChoosen = -2
	await get_tree().create_timer(0.4).timeout
	transition.Exit()


func _on_canvas_layer__transition_finished():
	if levelChoosen == -1:
		return
	
	if levelChoosen == 0:
		get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	elif levelChoosen == -2:
		get_tree().change_scene_to_file("res://Scenes/achievements.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/level_" + str(levelChoosen) + ".tscn")
		

func StartChangeScene(level : int):
	if levelChoosen != -1:
		return
	levelChoosen = level
	await get_tree().create_timer(0.4).timeout
	transition.Exit()
	
func _on_button_1_button_up():
	StartChangeScene(1)
func _on_button_2_button_up():
	StartChangeScene(2)
func _on_button_3_button_up():
	StartChangeScene(3)
func _on_button_4_button_up():
	StartChangeScene(4)
func _on_button_5_button_up():
	StartChangeScene(5)
func _on_button_6_button_up():
	StartChangeScene(6)
func _on_button_7_button_up():
	StartChangeScene(7)
func _on_button_8_button_up():
	StartChangeScene(8)
func _on_button_9_button_up():
	StartChangeScene(9)
func _on_button_10_button_up():
	StartChangeScene(10)
func _on_button_11_button_up():
	StartChangeScene(11)
func _on_button_12_button_up():
	StartChangeScene(12)
func _on_button_13_button_up():
	StartChangeScene(13)
func _on_button_14_button_up():
	StartChangeScene(14)
func _on_button_15_button_up():
	StartChangeScene(15)
func _on_button_16_button_up():
	StartChangeScene(16)
func _on_button_17_button_up():
	StartChangeScene(17)
func _on_button_18_button_up():
	StartChangeScene(18)
func _on_button_19_button_up():
	StartChangeScene(19)
func _on_button_20_button_up():
	StartChangeScene(20)
func _on_button_21_button_up():
	StartChangeScene(21)
func _on_button_22_button_up():
	StartChangeScene(22)
func _on_button_23_button_up():
	StartChangeScene(23)
func _on_button_24_button_up():
	StartChangeScene(24)
func _on_button_25_button_up():
	StartChangeScene(25)
func _on_button_26_button_up():
	StartChangeScene(26)
func _on_button_27_button_up():
	StartChangeScene(27)
func _on_button_28_button_up():
	StartChangeScene(28)
func _on_button_29_button_up():
	StartChangeScene(29)
func _on_button_30_button_up():
	StartChangeScene(30)


