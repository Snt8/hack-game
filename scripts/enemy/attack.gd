class_name EnemyAttack
extends Node2D

@export var damage: int = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerMovement:
		attack(damage)
		
func attack(damage: int) -> void:
	Events.enemy_damaged.emit(damage)
