extends CharacterBody2D
class_name Orc


@export @onready var velocity_component : VelocityComponent
@export @onready var pathfinding_component: PathfindingComponent
@export @onready var health_component: HealthComponent

func _ready():
	health_component.connect("on_death", on_death)

func get_player() -> Node2D:
	return get_node("%Player")


func _process(_delta):
	if Input.is_action_just_pressed("fire"):
		health_component.take_damage(1)
	var target = get_player().global_position if get_player() != null else global_position
	pathfinding_component.set_target_position(target)
	pathfinding_component.follow_path()
	velocity_component.move(self)


func on_death():
	queue_free()
