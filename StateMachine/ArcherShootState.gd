extends State

class_name ArcherAttackState

@export var Arrow : PackedScene
#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
@onready var archerFSM = $".."
@onready var spriteplayer =  $"../../bowSprites"
var isBowCharged: bool = false
var mouseLocation
var shootPosition:String
# Load the custom images for the mouse cursor.
var cursor = load("res://Assets/Cursors/cursorsprites.tres")


func Enter() -> void:
	#print("ShootingState")
	Input.set_custom_mouse_cursor(cursor)
	updateLocation()
	#print("while loop")
	
func Exit() -> void:
	isBowCharged = false
	Input.set_custom_mouse_cursor(null)
	
func Update(delta):
	#get mouse location when using bow
	mouseLocation = character.get_local_mouse_position()
	shootPosition = archerFSM.get_mouse_direction(mouseLocation)
	
func Unhandled_input(event):
	pass
	
func Physics_update(delta):
	updateLocation()
	if(Input.is_action_just_released("left_click")):
		if (isBowCharged):
			shoot()
			Transitioned.emit(self, "Idle")
		else: 
			#print("mouse release")
			Transitioned.emit(self, "Idle")
	
func updateLocation():
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
	
func shoot():
	var arrow = Arrow.instantiate()	
	arrow.transform = $"../../ArrowSpawn".transform
	#arrow.rotated(mouseLocation)
	arrow.rotation = mouseLocation.angle()
	#print("shoot towards mouse location: ",mouseLocation)
	owner.add_child(arrow)
	
#called on the animation tree
func chargedBow():
	isBowCharged = true
	animated_sprite.pause()
