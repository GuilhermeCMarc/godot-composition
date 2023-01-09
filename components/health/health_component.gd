extends Node
class_name HealthComponent

@export var max_health := 5

signal on_max_health_update
signal on_damage_taken
signal on_health_healed
signal on_death

var current_health: int

func _ready():
  current_health = max_health
  emit_signal("on_max_health_update", max_health)
  set_process(false)

func get_max_health() -> int:
  return max_health
  
func take_damage(amount: int):
  current_health -= amount
  emit_signal("on_damage_taken", current_health)
  if current_health <= 0:
    die()
    return

func heal(amount: int):
  current_health += amount if amount + current_health <= max_health else max_health
  emit_signal("on_health_healed", current_health)

func die():
  emit_signal("on_death")
