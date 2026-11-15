class_name Level
extends Node2D


func _ready() -> void:
	Events.player_died.connect(restart)

func restart() -> void:
	get_tree().reload_current_scene.call_deferred()
