extends State


#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
#@onready var joystick = $'../../../PlayerController/CanvasLayer/Joystick'
#@onready var joystick = $"../../../Joystick"
@onready var attackButton = $"../../../CanvasLayer/AttackButton"
var move_vector := Vector2.ZERO
	
func Enter() -> void:
	animated_sprite.play("idle")
	#print("IdleState")
	
func Exit() -> void:
	#print("exit idle")
	pass
	
	
func Update(delta):
	move_vector = Vector2.ZERO
	move_vector = Input.get_vector("move_left","move_right","move_up","move_down")
	if move_vector:
		print("move")
		Transitioned.emit(self, "PlayerRun")
#	if (Input.get_axis("move_left", "move_right") and Input.get_axis("move_up", "move_down")):
#		Transitioned.emit(self, "PlayerRun")
		
	
func Physics_update(delta):
	pass


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
	
