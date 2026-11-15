class_name Level
extends Node2D

@onready var enemy_attack1: EnemyAttack = $Enemy
@onready var enemy_attack2: EnemyAttack = $Enemy2
@onready var player_health: PlayerHealth = $Rabfran/PlayerHealth
@onready var health_ui: HeartAnimationManager = $Health

func _ready():
	enemy_attack1.damaged.connect(player_health.take_damage)
	enemy_attack2.damaged.connect(player_health.take_damage)
	player_health.damage_received.connect(health_ui.update_hearts)

