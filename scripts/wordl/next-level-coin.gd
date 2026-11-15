extends Node2D

@export_file("*.tscn") var level: String = "res://scenes/levels/mundo_dos.tscn"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerMovement:
		next_level()

func next_level() -> void:
	get_tree().change_scene_to_file.call_deferred(level)
