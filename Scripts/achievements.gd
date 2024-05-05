extends Control

@onready var transition : CanvasLayer = $Transition
var levelChoosen : int = -1

@onready var ninjaFrogSprite : AnimatedSprite2D = $VBoxContainer/NinjaFrog/Panel/AnimatedSprite2D
@onready var finSprite : AnimatedSprite2D = $VBoxContainer/FinWanabe/Panel/AnimatedSprite2D
@onready var amogusSprite : AnimatedSprite2D  = $VBoxContainer/Amogus/Panel/AnimatedSprite2D
@onready var ninjaDesc : Label = $VBoxContainer/NinjaFrog/Panel2/Desc
@onready var finDesc : Label = $VBoxContainer/FinWanabe/Panel2/Desc
@onready var amogusDesc : Label = $VBoxContainer/Amogus/Panel2/Desc

@onready var puluPuluEquipped = $VBoxContainer/PuluPuluGuy/Panel2/Equipped
@onready var ninjaEquipped = $VBoxContainer/NinjaFrog/Panel2/Equipped
@onready var finEquipped = $VBoxContainer/FinWanabe/Panel2/Equipped
@onready var amogusEquipped = $VBoxContainer/Amogus/Panel2/Equipped



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
	GlobalScript.saveFile.currentCharacter = 0
	puluPuluEquipped.visible = true
	ninjaEquipped.visible = false
	finEquipped.visible = false
	amogusEquipped.visible = false
	
	GlobalScript.saveFile.WriteSaveGame()
	pass

func _on_ninjafrog_button_up():
	if GlobalScript.saveFile.unlockedCharacters[0] == true:
		GlobalScript.saveFile.currentCharacter = 1
		puluPuluEquipped.visible = false
		ninjaEquipped.visible = true
		finEquipped.visible = false
		amogusEquipped.visible = false
	
	GlobalScript.saveFile.WriteSaveGame()




func _on_finwannabe_button_up():
	if GlobalScript.saveFile.unlockedCharacters[1] == true:
		GlobalScript.saveFile.currentCharacter = 2
		puluPuluEquipped.visible = false
		ninjaEquipped.visible = false
		finEquipped.visible = true
		amogusEquipped.visible = false
	
	GlobalScript.saveFile.WriteSaveGame()

func _on_amogus_button_up():
	if GlobalScript.saveFile.unlockedCharacters[2] == true:
		GlobalScript.saveFile.currentCharacter = 3
		puluPuluEquipped.visible = false
		ninjaEquipped.visible = false
		finEquipped.visible = false
		amogusEquipped.visible = true
	
	GlobalScript.saveFile.WriteSaveGame()
