extends PickableItem

@onready var confetti : Node2D = $Confetti
signal _levelComplete
var theBody

func PickUp(body):
	super.PickUp(body)
	for i in confetti.get_children():
		i.emitting = true
	pass
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		#body.DisablePlayer()
		PickUp(body)
		await get_tree().create_timer(0.8).timeout
		body.playerUI.winUI()

