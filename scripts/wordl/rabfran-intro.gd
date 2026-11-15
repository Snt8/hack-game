class_name RabIntro
extends CharacterBody2D

@export_group("Movement Settings")
@export var speed: float = 100.0
@export var acceleration: float = 800.0
@export var jump_force: float = -300.0

@export_group("Camera Settings")
@export var camera_zoom: Vector2 = Vector2(0.85, 0.85)
@export var enable_smoothing: bool = true

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = jump_force

	move_and_slide()
