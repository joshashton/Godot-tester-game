extends State

class_name ArcherAttackState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
@onready var playerFSM = $".."
@onready var spriteplayer =  $"../../Sprite2D"

func Enter() -> void:
	
	print("AttackState")
	
	
	animated_sprite.play("shootside")
		
	
	#wait for anomation player to finish then return
	await animated_sprite.animation_finished
	Transitioned.emit(self, "Idle")
	
#switch statement
func Exit() -> void:
	pass
	

