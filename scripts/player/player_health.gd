class_name PlayerHealth
extends Node2D

@export_group("HealthSettings")
@export var number_hearts: float = 3.0

@onready var inmutity_timer: Timer = $InmunityTimer

signal damage_received(current_hearts: float)
signal inmunity_started
signal inmunity_ended

var is_inmune: bool = false

func take_damage(quantity: int) -> void:
	if not is_inmune:
		number_hearts -= quantity
		damage_received.emit(number_hearts)

func become_inmune(time: float):
	is_inmune = true
	inmutity_timer.start(time)
	inmunity_started.emit()

func _on_inmunity_timer_timeout() -> void:
	is_inmune = false
	inmunity_ended.emit()
