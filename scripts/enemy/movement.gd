class_name EnemyMovement
extends CharacterBody2D

@export var speed: float = 100.0
@export var acceleration: float = 800.0
@export var jump_force: float = -200.0

@onready var edge_detector: RayCast2D = $EdgeDetector
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = -1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = jump_force

	if is_on_wall():
		direction *= -1
		update_raycast_position()

	if edge_detector.is_colliding() == false and is_on_floor():
		direction *= -1
		update_raycast_position()

	velocity.x = direction * speed
	animated_sprite.play("default")
	move_and_slide()

func update_raycast_position() -> void:
	edge_detector.position.x = abs(edge_detector.position.x) * direction
