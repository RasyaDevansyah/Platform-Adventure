extends Control

@onready var transition : CanvasLayer = $Transition
var levelChoosen : int = -1

@onready var ninjaFrogSprite : AnimatedSprite2D = $VBoxContainer/NinjaFrog/Panel/AnimatedSprite2D
@onready var finSprite : AnimatedSprite2D = $VBoxContainer/FinWanabe/Panel/AnimatedSprite2D
@onready var amogusSprite : AnimatedSprite2D  = $VBoxContainer/Amogus/Panel/AnimatedSprite2D
@onready var ninjaDesc : Label = $VBoxContainer/NinjaFrog/Panel2/Desc
@onready var finDesc : Label = $VBoxContainer/FinWanabe/Panel2/Desc
@onready var amogusDesc : Label = $VBoxContainer/Amogus/Panel2/Desc


func _ready():
	if GlobalScript.saveFile.unlockedCharacters[0] == true:
		UnlockNinjaFrog()
	if GlobalScript.saveFile.unlockedCharacters[1] == true:
		UnlockFinWannaBe()
	if GlobalScript.saveFile.unlockedCharacters[2] == true:
		UnlockAmogus()
	
func UnlockNinjaFrog():
	ninjaFrogSprite.modulate = Color.WHITE
	ninjaDesc.text = "Ninja Frog"
	
func UnlockFinWannaBe():
	finSprite.modulate = Color.WHITE
	finDesc.text = "Fin Wannabe"

func UnlockAmogus():
	amogusSprite.modulate = Color.WHITE
	amogusDesc.text = "Amogus"



func _on_back_button_up():
	await get_tree().create_timer(0.4).timeout
	levelChoosen = 1
	transition.Exit()


func _on_transition__transition_finished():
	if levelChoosen == 1:
		get_tree().change_scene_to_file("res://Scenes/level_select.tscn")



func _on_pulupulu_button_up():
	print("pulupulu")
	pass # Replace with function body.


func _on_ninjafrog_button_up():
	print("Ninja")
	pass # Replace with function body.


func _on_finwannabe_button_up():
	print("Fin")
	pass # Replace with function body.


func _on_amogus_button_up():
	print("amogus")
	pass # Replace with function body.
