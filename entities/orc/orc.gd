extends CharacterBody2D
class_name Orc

@export @onready var chase_component: ChaseComponent

func _physics_process(delta: float) -> void:
  chase_component.chase_behaviour(delta)
