extends State

class_name AttackState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"

func Enter() -> void:
	
	print("AttackState")
	
	#wait for anomation player to finish then return
	animated_sprite.play("attack")
	await animated_sprite.animation_finished
	Transitioned.emit(self, "Idle")
	
func Exit() -> void:
	pass
