extends ColorRect
class_name HealthPoint


const COLOR_DISABLED := "#777"
const COLOR_ENABLED := "#fff"


func _ready():
  enable()
  set_process(false) # disable process


func disable() -> void:
  # todo: add animations
  self.color = COLOR_DISABLED


func enable() -> void:
  # todo: add animations
  self.color = COLOR_ENABLED