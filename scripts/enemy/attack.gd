class_name EnemyAttack
extends Node2D

@export var damage: int = 1
signal damaged(amount: float)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlayerMovement:
		attack(damage)
		
func attack(damage: int) -> void:
	damaged.emit(damage)
