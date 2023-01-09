extends Area2D
class_name HurtBoxComponent

@export var health_component : HealthComponent

func _on_area_entered(area:Area2D):
	if area is AttackBoxComponent:
		print(area.get_parent().name, " hit ", self.get_parent().name)
		health_component.take_damage(area.get_damage())
	
