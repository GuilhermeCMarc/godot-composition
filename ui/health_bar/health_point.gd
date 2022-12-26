extends ColorRect
class_name HealthPoint


const COLOR_DISABLED := "#6e2727"
const COLOR_ENABLED := "#e83b3b"


func _ready():
  enable()
  set_process(false) # disable process


func disable() -> void:
  # todo: add animations
  self.color = COLOR_DISABLED


func enable() -> void:
  # todo: add animations
  self.color = COLOR_ENABLED