extends Button

func _ready():
	connect("mouse_entered", ScaleUp)
	connect("mouse_exited", ScaleDown)
	connect("button_down", ScaleDown)
	connect("button_up", ScaleUp)

@onready var trophy_1 = $Trophy1
@onready var trophy_2 = $Trophy2
@onready var trophy_3 = $Trophy3

func ScaleUp():
	trophy_1.scale = Vector2(0.538, 0.538)
	trophy_2.scale = Vector2(0.538, 0.538)
	trophy_3.scale = Vector2(0.538, 0.538)
	pass

func ScaleDown():
	trophy_1.scale = Vector2(0.438, 0.438)
	trophy_2.scale = Vector2(0.438, 0.438)
	trophy_3.scale = Vector2(0.438, 0.438)
	pass
