extends Node
class_name MovementComponent

@export_node_path(CharacterBody2D) var character_body

@export var max_speed := 80
@export var acceleration := 500
@export var friction := 500


var vec_velocity := Vector2.ZERO

# returns the current velocity of the component
func get_current_velocity() -> Vector2:
	return vec_velocity

# moves towards a direction, applies friction and acceleration
func move_to_direction(delta : float, direction : Vector2) -> void:
	if direction != Vector2.ZERO:
		vec_velocity = vec_velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		vec_velocity = vec_velocity.move_toward(Vector2.ZERO, friction * delta)
	vec_velocity = character_body.move_and_slide(vec_velocity)

# moves to a direction, ignoring the acceleration
func move_instantanly(delta : float, direction : Vector2, speed: int) -> void:
	vec_velocity = direction * speed
