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
	
func Exit() -> void:
	isBowCharged = false
	
func Update(delta):
	if isBowCharged && Input.is_action_just_released("left_click"):
		#instantiate arrow
		pass
	
	if (Input.is_action_pressed("left_click")):
		#get mouse location when using bow
		mouseLocation = character.get_local_mouse_position()
		shootPosition = archerFSM.get_mouse_direction(mouseLocation)
	
	elif(Input.is_action_just_released("left_click")):
		print("mouse release")
		Transitioned.emit(self, "Idle")
		isBowCharged = false
	
func Unhandled_input(event):
	pass
	
func Physics_update(delta):
	# Get the current position of the playback cursor
	var current_frame = animated_sprite.get_current_animation_position()
	if isBowCharged:
		current_frame = 0.5
	match shootPosition:
		"up":
			spriteplayer.flip_h = false
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
	#set animation to correct frame
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
