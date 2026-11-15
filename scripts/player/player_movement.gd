class_name PlayerMovement
extends CharacterBody2D

@export_group("Movement Settings")
@export var speed: float = 100.0
@export var acceleration: float = 800.0
@export var jump_force: float = -300.0

@export_group("Camera Settings")
@export var camera_zoom: Vector2 = Vector2(0.85, 0.85)
@export var enable_smoothing: bool = true

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera = $Camera2D

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	activate_camera()
	camera.zoom = camera_zoom
	camera.position_smoothing_enabled = enable_smoothing

func activate_camera():
	camera.enabled = true
	camera.make_current()

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("movement-left", "movement-right")

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = jump_force

	if direction < 0:
		animated_sprite.play("bounce-left")
	else:
		animated_sprite.play("bounce-right")

	if direction != 0:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
