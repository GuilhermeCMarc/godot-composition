extends NavigationAgent2D
class_name AIPathfindingComponent


@export @onready var velocity_component : VelocityComponent
@export @onready var character_body : CharacterBody2D

@export var chase_range := 120

@onready var ray_cast: RayCast2D = $RayCast2D


var next_position : Vector2 = null
var is_chasing := false
var target: Node2D = null


func chase(next_target: Node2D):
	target = next_target
	is_chasing = true


func stop_chasing():
	is_chasing = false


func chase_behaviour(delta):
		if !is_chasing or target == null:
			return

		if is_target_reachable() and !is_target_reached():
			velocity_component.accelerate_towards(delta, get_next_location())
		else:
			velocity_component.apply_friction(delta)


func can_see_target() -> bool:
	if target == null:
		return false
	
	ray_cast.target_position = target.global_position
	if ray_cast.is_colliding():
		# ???
		pass
	return false


# Questions:
# What happens when the player dies?