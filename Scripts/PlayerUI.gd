class_name PlayerUI
extends CanvasLayer

@onready var win_animation : AnimationPlayer= $WinAnimation

@onready var label : Label= $HBoxContainer/Label
var currentNumber : int = 0

func _ready():
	ChangeCount(currentNumber)

func AddFruit():
	currentNumber += 1
	ChangeCount(currentNumber)
	
func ChangeCount(number : int):
	label.text = " : " + str(number)

func winUI():
	win_animation.play("Win")


func _on_restart_button_up():
	pass


func _on_next_button_up():
	pass


func _on_level_button_up():
	pass
