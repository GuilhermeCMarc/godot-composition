extends Node
class_name VelocityComponent

@export var max_speed := 80
@export var acceleration := 500
@export var friction := 500


func _ready():
	set_process(false) # deactivates process


var vec_velocity := Vector2.ZERO


func get_current_velocity() -> Vector2:
	return vec_velocity


func accelerate_towards(delta: float, direction: Vector2) -> void:
	vec_velocity = vec_velocity.move_toward(direction * max_speed, acceleration * delta)


func apply_friction(delta: float) -> void:
	vec_velocity = vec_velocity.move_toward(Vector2.ZERO, friction * delta)


func maximize(direction : Vector2) -> void:
		vec_velocity = direction * max_speed


func move(body: CharacterBody2D) -> void:
	body.velocity = vec_velocity
	body.move_and_slide()
