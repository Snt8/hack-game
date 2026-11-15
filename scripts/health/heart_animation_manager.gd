class_name HeartAnimationManager
extends Node2D

@onready var heart_animation: AnimatedSprite2D = $AnimatedSprite2D

var heart_animation_collection = ["full-live", "mid-live", "no-live"]
var actual_heart_sprite: int = 0

func _ready() -> void:
	Events.player_health_changed.connect(update_hearts)

func update_hearts(_current_hearts: float) -> void:
	actual_heart_sprite = min(actual_heart_sprite + 1, heart_animation_collection.size() - 1)
	heart_animation.play(heart_animation_collection[actual_heart_sprite])
