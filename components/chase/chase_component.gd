extends NavigationAgent2D
class_name ChaseComponent

@export @onready var velocity_component : VelocityComponent
@export @onready var character_body : CharacterBody2D

@export var max_view_distance := 600

var is_chasing := false
var target: Node2D = null


func chase(next_target: Node2D):
	target = next_target
	is_chasing = true


func stop_chasing():
	is_chasing = false


func chase_behaviour(delta):
	print(is_chasing, target)

	if !is_chasing or target == null:
		return

	self.target_location = target.global_position

	var ray_cast := RayCast2D.new()
	self.add_child(ray_cast)

	if can_see_target(ray_cast) and is_target_reachable() and not is_target_reached():
		velocity_component.accelerate_towards(delta, get_next_location())
	else:
		if target != null and is_chasing:
			stop_chasing()
		velocity_component.apply_friction(delta)

	ray_cast.queue_free()
	velocity_component.move(character_body)


func can_see_target(ray_cast: RayCast2D) -> bool:
	if target == null:
		return false
	
	var from := character_body.global_position
	var to := target.global_position
	ray_cast.to_global((from - to).normalized() * max_view_distance)
	return ray_cast.is_colliding() and (ray_cast.get_collider() is Player)

