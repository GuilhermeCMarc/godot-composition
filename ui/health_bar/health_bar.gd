extends Control
class_name HealthBarUI

@export var health_component: HealthComponent

@onready var health_point_scene : PackedScene = preload("res://ui/health_bar/health_point.tscn")
@onready var points_holder: GridContainer = $"%PointsHolder"

func _ready():
	visible = false
	health_component.connect("on_damage_taken", update_health)
	health_component.connect("on_max_health_update", update_max_health)


func update_health(new_value: int) -> void:
	# todo: animate
	var max_health := get_max_health()
	if max_health == 0:
		init(health_component.get_max_health())
		max_health = health_component.get_max_health()
	var value_to_update := new_value if new_value <= max_health else max_health # ensures that will not update a bigger value
	for i in range(value_to_update):
		(points_holder.get_children()[max_health - i - 1] as HealthPoint).enable()
	for i in range(max_health - value_to_update):
		(points_holder.get_children()[i] as HealthPoint).disable()


func init(max_health: int):
	update_max_health(max_health)
	visible = true

func update_max_health(max_health: int) -> void:
	# todo: animate
	delete_children()
	for i in range(max_health):
		points_holder.add_child(health_point_scene.instantiate())


func get_max_health() -> int:
	return points_holder.get_child_count()


func delete_children() -> void:
	for n in points_holder.get_children():
		points_holder.remove_child(n)
		n.queue_free()
