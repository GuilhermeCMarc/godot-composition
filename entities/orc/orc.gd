extends CharacterBody2D
class_name Orc


@export @onready var velocity_component : VelocityComponent
@export @onready var pathfinding_component: PathfindingComponent


func get_player() -> Node2D:
	return get_node("%Player")


func _process(_delta):
	var target = get_player().global_position if get_player() != null else global_position
	pathfinding_component.set_target_position(target)
	pathfinding_component.follow_path()
	velocity_component.move(self)