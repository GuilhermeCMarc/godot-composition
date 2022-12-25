extends CharacterBody2D
class_name Player

@export var movement_component: MovementComponent
@export var input_component: InputComponent

@export var dodge_speed := 500

func _physics_process(delta: float) -> void:
	move_with_input(delta)

func move_with_input(delta: float) -> void:
	movement_component.move_to_direction(delta, input_component.get_movement())
