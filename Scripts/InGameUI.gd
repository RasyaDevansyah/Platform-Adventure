extends CanvasLayer

@onready var transition = $"../Transition" as Transition
@onready var winAnimation : AnimationPlayer = $WinAnimation

var sceneNumber : int = -1
var trophyAnim : String = "3Trophies"

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

func _on_trophy__level_complete(fruitCount):
	CalculateTrophy(fruitCount)
	
func CalculateTrophy(fruitCount):
	var fruitPercentage : float = float(fruitCount) / float(TotalFruitCount.totalFruit) * 100.0
	
	if fruitPercentage <= 50.0:
		trophyAnim = "1Trophy"
	elif fruitPercentage <= 75.0:
		trophyAnim = "2Trophies"
	else:
		trophyAnim = "3Trophies"

	winAnimation.play("Win")



func _on_pulu_pulu_guy__player_death():
	await get_tree().create_timer(0.7).timeout
	_on_restart_button_up()


func _on_win_animation_animation_finished(anim_name):
	if anim_name == "Win":
		winAnimation.play(trophyAnim)
