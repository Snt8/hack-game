class_name Level
extends Node2D

@onready var enemy: EnemyAttack = $Enemy
@onready var player_health: PlayerHealth = $Rabfran/PlayerHealth
@onready var health_ui: HeartAnimationManager = $Health

func _ready():
	enemy.damaged.connect(player_health.take_damage)
	player_health.damage_received.connect(health_ui.update_hearts)
