class_name PlayerHealth
extends Node2D

@export_group("HealthSettings")
@export var number_hearts: float = 2.0

@onready var inmutity_timer: Timer = $InmunityTimer

var is_inmune: bool = false

func _ready() -> void:
	Events.enemy_damaged.connect(take_damage)

func take_damage(quantity: int) -> void:
	if not is_inmune:
		number_hearts -= quantity
		Events.player_health_changed.emit(number_hearts)
	
	if number_hearts <= 0:
		Events.player_died.emit()

func become_inmune(time: float):
	is_inmune = true
	inmutity_timer.start(time)
	Events.player_inmunity_started.emit()

func _on_inmunity_timer_timeout() -> void:
	is_inmune = false
	Events.player_inmunity_ended
