extends State

class_name AttackState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
@onready var playerFSM = $".."
@onready var spriteplayer =  $"../../Sprite2D"

const SPEED = 300.0

func Enter() -> void:
	
	#print("AttackState")
	#print(playerFSM.attackPosition)
	if playerFSM.attackPosition == "right":
		spriteplayer.flip_h = false
		animated_sprite.play("attack")
	elif playerFSM.attackPosition == "left":
		spriteplayer.flip_h = true
		animated_sprite.play("attack2")
	elif playerFSM.attackPosition == "up":
		animated_sprite.play("attackup")
	else :
		animated_sprite.play("attackdown")

	#wait for anomation player to finish then return
	await animated_sprite.animation_finished
	Transitioned.emit(self, "Idle")
	
#switch statement
func Exit() -> void:
	pass
	
