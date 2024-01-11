extends CharacterBody2D

@export var speed = 400
@onready var animated_sprite = $AnimatedSprite2D
var input_direction
var mouse_direction

func get_input():
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	InputEventMouseButton
	#if Input.get_vector("mouse"):
		#get_local_mouse_position()
	update_animation()
	update_facing_direction()
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Left button was clicked at ", event.position)
				
			else:
				print("Left button was released")
				

func update_animation():
	if input_direction != Vector2.ZERO:
		animated_sprite.play("move")
	else:
		animated_sprite.play("idle")
		
func update_facing_direction():
	if input_direction.x >0:
		animated_sprite.flip_h = false
	elif input_direction.x <0:
		animated_sprite.flip_h = true
