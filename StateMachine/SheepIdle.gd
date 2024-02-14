extends State
class_name SheepIdleState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"

func Enter() -> void:
	animated_sprite.play("Idle")
	print("IdleState")
	
func Exit() -> void:
	pass
	
func Update(delta):
	if character.isDead == true:
		Transitioned.emit(self, "Die")
		
func Unhandled_input(event):
	pass
	
func Physics_update(delta):
	pass

