extends State


#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
@onready var joystick = $'../../../CanvasLayer/Attack Joystick'
@onready var spriteplayer =  $"../../Sprite2D"
var attackPosition
	
func Enter() -> void:
	#check what direction joystick.output
	#print(joystick.output)
	
	
	attackPosition = get_mouse_direction(joystick.output)
	#print(attackPosition)
	if attackPosition == "right":
		#print(attackPosition)
		##print('right if')
		spriteplayer.flip_h = false
		animated_sprite.play("attack")
	elif attackPosition == "left":
		#print(attackPosition)
		#print('left if')
		
		animated_sprite.play("lattack")
	elif attackPosition == "up":
		#print(attackPosition)
		#print('up if')
		animated_sprite.play("attackup")
	else :
		#print(attackPosition)
		#print('down if')
		animated_sprite.play("attackdown")
		
	#animated_sprite.play("attack")
	#wait for anomation player to finish then return
	await animated_sprite.animation_finished
	Transitioned.emit(self, "PlayerIdle")
	
func Exit() -> void:
	#print("exit Attack")
	pass
	
	
func Update(delta):
	pass
		
	
func Physics_update(delta):
	pass
	
func get_mouse_direction(vector:Vector2):
	#if vector.x> 0:
		#return "right"
	#else:
		#return "left"
		#-3 - 0
		
	var angle = rad_to_deg(vector.angle())
	#print(angle)
	if angle >= -45.0 && angle < 45.0:
		return "right"
	elif angle >= 45.0 && angle < 135.0:
		return "down"
	elif angle >= -135.0 && angle < -45.0:
		return "up"
	else:
		return "left"
