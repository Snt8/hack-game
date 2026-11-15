class_name EnemyMovement
extends CharacterBody2D

@export var speed: float = 100.0
@export var edge_look_ahead: float = 8.0   # cuántos px por delante mira el rayo

@onready var edge_detector: RayCast2D = $EdgeDetector
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: int = -1

func _ready() -> void:
	update_raycast_position()
	animated_sprite.play("default")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor() and (is_on_wall() or not edge_detector.is_colliding()):
		direction *= -1
		update_raycast_position()

	velocity.x = direction * speed
	move_and_slide()

func update_raycast_position() -> void:
	edge_detector.position.x = edge_look_ahead * direction
	edge_detector.force_raycast_update()
