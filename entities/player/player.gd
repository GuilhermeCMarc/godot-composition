extends CharacterBody2D
class_name Player


@export @onready var velocity_component : VelocityComponent


func _process(_delta):
	velocity_component.accelerate_in_direction(get_movement())
	velocity_component.move(self)


func get_movement() -> Vector2:
	var movement := Vector2.ZERO
	movement.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	movement.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return movement.normalized()