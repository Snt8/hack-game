class_name Carrot
extends Node2D

@export var inmunity_time: float = 2.5

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_powerup(body)

func get_powerup(body: Node2D):
	if body.has_method("become_inmune"):
		body.become_inmune(inmunity_time)
		queue_free()
