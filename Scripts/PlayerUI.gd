class_name PlayerUI
extends CanvasLayer

@onready var label : Label= $HBoxContainer/Label
var currentNumber : int = 0

func _ready():
	ChangeCount(currentNumber)

func AddFruit():
	currentNumber += 1
	ChangeCount(currentNumber)
	
func ChangeCount(number : int):
	label.text = " : " + str(number)
