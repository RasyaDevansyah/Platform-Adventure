extends CanvasLayer

@onready var transition = $"../Transition" as Transition
@onready var winAnimation : AnimationPlayer = $WinAnimation
@onready var next : Button = $WinPanel/Next
@onready var achievements : Panel = $Achievements

var sceneNumber : int = -1
var trophyAnim : String = "1Trophy"
var currentLevel 
var nextLevel

func _ready():
	currentLevel = int(str(get_tree().get_first_node_in_group("Level").name)) -1
	nextLevel = currentLevel + 2
	print(get_tree().get_first_node_in_group("Level").name)

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
			get_tree().change_scene_to_file("res://Scenes/level_" + str(nextLevel) + ".tscn")
			pass
		
	pass 

func _on_trophy__level_complete(fruitCount):
	CalculateTrophy(fruitCount)
	
func CalculateTrophy(fruitCount):
	if GlobalScript.saveFile.maxLevel < nextLevel:
		next.disabled = true
		
	var fruitPercentage : float = float(fruitCount) / float(GlobalScript.totalFruit) * 100.0
	
	if fruitPercentage <= 50.0:
		GlobalScript.saveFile.levelTrophies[currentLevel] = max(GlobalScript.saveFile.levelTrophies[currentLevel], 1)
		trophyAnim = "1Trophy"
	elif fruitPercentage > 50.0 and fruitPercentage <= 99.0:
		GlobalScript.saveFile.levelTrophies[currentLevel] = max(GlobalScript.saveFile.levelTrophies[currentLevel], 2)
		trophyAnim = "2Trophies"
	else:
		GlobalScript.saveFile.levelTrophies[currentLevel] = max(GlobalScript.saveFile.levelTrophies[currentLevel], 3)
		trophyAnim = "3Trophies"
	GlobalScript.saveFile.levelUnlocked = max(GlobalScript.saveFile.levelUnlocked, nextLevel)
	GlobalScript.saveFile.WriteSaveGame()
	winAnimation.play("Win")
	await get_tree().create_timer(0.2).timeout
	achievements.CheckThrophies()


func _on_pulu_pulu_guy__player_death():
	await get_tree().create_timer(0.7).timeout
	_on_restart_button_up()


func _on_win_animation_animation_finished(anim_name):
	if anim_name == "Win":
		winAnimation.play(trophyAnim)
