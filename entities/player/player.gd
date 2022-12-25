extends CharacterBody2D

@export_node_path(MovementComponent) var movement_component
@export_node_path(InputComponent) var input_component

@export var dodge_speed := 500

enum states {
	MOVING,
	DODGE,
}


func _physics_process(delta: float) -> void:
	move_with_input(delta)


func move_with_input(delta: float) -> void:
	movement_component.move_to_direction(delta, input_component.get_movement())
