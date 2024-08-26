extends State

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
#@onready var joystick = $'../../../PlayerController/CanvasLayer/Joystick'
#@onready var joystick = $"../../../Joystick"
@onready var attackButton = $"../../../CanvasLayer/AttackButton"
@onready var spriteplayer =  $"../../Sprite2D"


@export var speed = 400
var input_direction
var input_vector := Vector2.ZERO

func Enter() -> void:
	animated_sprite.play("run")
	#print("Run")
	

func Update(delta):
	
	input_vector.x = Input.get_axis("move_left", "move_right")
	input_vector.y = Input.get_axis("move_up", "move_down")
	#input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	move(input_vector)

	#stopped moving - go to idle
	if(input_vector.length() == 0):
		Transitioned.emit(self, "PlayerIdle")
				
				
func move(input_direction):
	update_facing_direction()
	character.velocity = input_direction * speed
	character.move_and_slide()

func Physics_update(delta):
	pass
	
func update_facing_direction():
	if input_vector.x >0:
		spriteplayer.flip_h = false
	elif input_vector.x <0:
		spriteplayer.flip_h = true
		
func Unhandled_input(event):
	
	#if Input.is_action_just_pressed("attack_button"):
	#	print('attack_button')
	
	# is action pressed()
	#if event.is_action_pressed('attack_button'):
	#	print('action')
	
	
	#if attackButton.touched:
	#	print('attackButton')
	#	Transitioned.emit(self, "PlayerAttack")
	#if attackbutton pressed go to attack sstate
	if attackButton.is_pressed():
		print('attackButton')
		Transitioned.emit(self, "PlayerAttack")
