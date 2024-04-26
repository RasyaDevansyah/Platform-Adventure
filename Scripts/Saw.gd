extends Area2D



func _on_body_entered(body):
	if body.is_in_group("Player") and body.has_method("Hit"):
		var knockbackDirection : Vector2 = (body.global_position - global_position).normalized()
		body.Hit(knockbackDirection)
		
