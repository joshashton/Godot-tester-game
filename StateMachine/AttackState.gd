extends State

class_name AttackState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
@onready var playerFSM = $".."
@onready var spriteplayer =  $"../../Sprite2D"

func Enter() -> void:
	
	print("AttackState")
	print(playerFSM.attackPosition)
	if playerFSM.attackPosition == "right":
		spriteplayer.flip_h = false
	else:
		spriteplayer.flip_h = true
	#wait for anomation player to finish then return
	animated_sprite.play("attack")
	await animated_sprite.animation_finished
	Transitioned.emit(self, "Idle")
	
func Exit() -> void:
	pass
	

