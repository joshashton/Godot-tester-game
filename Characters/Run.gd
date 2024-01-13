extends State

class_name ArcherRunState

@export var speed = 400
var input_direction

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
@onready var spriteplayer =  $"../../bowSprites"
func Enter() -> void:
	animated_sprite.play("run")
	print("RunState")
	
func Exit() -> void:
	pass
	
func Update(delta):
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	move(input_direction)

	#stopped moving - go to idle
	if(input_direction.length() == 0):
		Transitioned.emit(self, "Idle")
		
		
func Unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Left button was clicked at ", event.position)
				Transitioned.emit(self, "Shoot")
			else:
				print("Left button was released")
				
func move(input_direction):
	update_facing_direction()
	character.velocity = input_direction * speed
	character.move_and_slide()

func Physics_update(delta):
	pass
	
func update_facing_direction():
	if input_direction.x >0:
		spriteplayer.flip_h = false
	elif input_direction.x <0:
		spriteplayer.flip_h = true
		
		
