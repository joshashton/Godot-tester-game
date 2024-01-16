extends State

class_name ArcherAttackState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
@onready var archerFSM = $".."
@onready var spriteplayer =  $"../../bowSprites"
var isBowCharged: bool = false
var mouseLocation

func Enter() -> void:
	
	print("ShootingState")
	
	#starting shooting location
	print(archerFSM.startingShootPosition)
	if archerFSM.startingShootPosition == "up":
		spriteplayer.flip_h = false
		animated_sprite.play("shootup")
	elif archerFSM.startingShootPosition == "upside":
		spriteplayer.flip_h = false
		animated_sprite.play("shootupside")
	elif archerFSM.startingShootPosition == "side":
		spriteplayer.flip_h = false
		animated_sprite.play("shootside")
	elif archerFSM.startingShootPosition == "downside":
		spriteplayer.flip_h = false
		animated_sprite.play("shootdownside")
	elif archerFSM.startingShootPosition == "down":
		spriteplayer.flip_h = false
		animated_sprite.play("shootdown")
	elif archerFSM.startingShootPosition == "flipupside":
		spriteplayer.flip_h = true
		animated_sprite.play("shootupside")
	elif archerFSM.startingShootPosition == "flipside":
		spriteplayer.flip_h = true
		animated_sprite.play("shootside")
	elif archerFSM.startingShootPosition == "flipdownside":
		spriteplayer.flip_h = true
		animated_sprite.play("shootdownside")
	elif archerFSM.startingShootPosition == "flipdown":
		spriteplayer.flip_h = true
		animated_sprite.play("shootdown")
	else:
		spriteplayer.flip_h = true
		animated_sprite.play("shootup")
	#wait for anomation player to finish then return
	
	#Transitioned.emit(self, "Idle")
	
#switch statement
func Exit() -> void:
	pass
	
func Update(delta):
	if (Input.is_action_pressed("left_click")):
		isAiming()
		var attackMouse = character.get_local_mouse_position()
				
		mouseLocation = attackMouse
		#print(mouseLocation)
		#animated_sprite.seek()
		#
	elif(Input.is_action_just_released("left_click")):
		print("mouse release")
		Transitioned.emit(self, "Idle")
	
func Unhandled_input(event):
	pass
	
func isAiming():
	pass
	
func chargedBow():
	isBowCharged = true
	animated_sprite.pause()
