extends Node
class_name MovementComponent

@export var character_body: CharacterBody2D
@export var velocity_component: VelocityComponent

func _ready():
	set_process(false) # deactivates process

func move_to_direction(delta : float, direction : Vector2) -> void:
	if direction != Vector2.ZERO:
		velocity_component.accelerate_towards(delta, direction.normalized())
	else:
		velocity_component.apply_friction(delta)
	velocity_component.move(character_body)
