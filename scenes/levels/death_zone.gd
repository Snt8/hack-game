extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerMovement:
		Events.player_died.emit()
	else:
		body.queue_free()
