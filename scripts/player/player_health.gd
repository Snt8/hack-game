class_name PlayerHealth
extends Node2D

@export_group("HealthSettings")
@export var number_hearts: float = 3.0

signal damage_received(current_hearts: float)

func take_damage(quantity: int) -> void:
	number_hearts -= quantity
	damage_received.emit(number_hearts)
