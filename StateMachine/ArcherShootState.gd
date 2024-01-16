extends State

class_name ArcherAttackState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
@onready var archerFSM = $".."
@onready var spriteplayer =  $"../../bowSprites"
var isBowCharged: bool = false
var mouseLocation
var shootPosition:String

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
	
	if isBowCharged && Input.is_action_just_released("left_click"):
		#instantiate arrow
		pass
	
	if (Input.is_action_pressed("left_click")):
			
		var attackMouse = character.get_local_mouse_position()
		#print(attackMouse)	
		mouseLocation = attackMouse
		var angle = rad_to_deg(mouseLocation.angle())
		
		#update mouse location string
		if (angle >= -90 && angle < -54):
			shootPosition = "up"
		elif (angle >= -54 && angle < -18):
			shootPosition = "upside"
		elif (angle >= -18 && angle < 18):
			shootPosition = "side"
		elif (angle >= 18 && angle < 54):
			shootPosition = "downside"
		elif(angle >= 54 && angle < 90):
			shootPosition = "down"
		elif (angle >= 90 && angle < 126):
			shootPosition = "flipdown"
		elif (angle >= 126 && angle < 162):
			shootPosition = "flipdownside"
		elif (angle >= -126 && angle < -90):
			shootPosition = "flipup"
		elif (angle >= -162 && angle < -126):
			shootPosition = "flipupside"
		else:
			shootPosition = "flipside"
		print(shootPosition)
	
		#isAiming(mouseLocation)
		#print(mouseLocation)
		#animated_sprite.seek()
		#
	elif(Input.is_action_just_released("left_click")):
		print("mouse release")
		Transitioned.emit(self, "Idle")
	
func Unhandled_input(event):
	pass
	
func Physics_update(delta):
	# Get the current position of the playback cursor
	var current_frame = animated_sprite.get_current_animation_position()
	match shootPosition:
		"up":
			spriteplayer.flip_h = false
			
			# Set the new animation	    
			# Seek to the same frame in the new animation
			animated_sprite.play("shootup")
		"upside":
			spriteplayer.flip_h = false
			animated_sprite.play("shootupside")
		"side":
			spriteplayer.flip_h = false
			animated_sprite.play("shootside")
		"downside":
			spriteplayer.flip_h = false
			animated_sprite.play("shootdownside")
		"down":
			spriteplayer.flip_h = false
			animated_sprite.play("shootdown")
		"flipupside":
			spriteplayer.flip_h = true
			animated_sprite.play("shootupside")
		"flipside":
			spriteplayer.flip_h = true
			animated_sprite.play("shootside")
		"flipdownside":
			spriteplayer.flip_h = true
			animated_sprite.play("shootdownside")
		"flipdown":
			spriteplayer.flip_h = true
			animated_sprite.play("shootdown")
		_:
			spriteplayer.flip_h = true
			animated_sprite.play("shootup")
	animated_sprite.seek(current_frame)
	
func isAiming(mouseLocation):
	var stringDirection = archerFSM.get_mouse_direction(mouseLocation)
	print("mouse movement:", stringDirection)
	#animated_sprite.play("shootdownside")
	#shootingAnimation(stringDirection)
	
#called on the animation tree
func chargedBow():
	isBowCharged = true
	animated_sprite.pause()
