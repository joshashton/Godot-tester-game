extends State
class_name SheepDeadState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"

func Enter() -> void:

	print("Sheep killed")
	
func Exit() -> void:
	pass
	
func Update(delta):
	pass
		
func Unhandled_input(event):
	pass
	
func Physics_update(delta):
	pass

