extends PickableItem

func _ready():
	super._ready()
	TotalFruitCount.totalFruit += 1

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		PickUp(body)
		var fruitscript : PlayerUI = body.playerUI
		fruitscript.AddFruit()

func _on_animated_sprite_2d_animation_finished():
	queue_free()
