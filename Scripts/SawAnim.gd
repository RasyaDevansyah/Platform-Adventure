extends Node2D

@onready var saw2 : AnimationPlayer = $Saw2

@export var startBackwards : bool = false
@export_range (0.0,16.0, 0.001) var startAtTime : float = 0.0


func _ready():
	if startBackwards:
		saw2.play_backwards("SawMoving")
	else:
		saw2.play("SawMoving")
	
	saw2.advance(startAtTime)

