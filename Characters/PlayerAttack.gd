extends State


#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
#@onready var joystick = $'../../../PlayerController/CanvasLayer/Joystick'
@onready var joystick = $"../../../Joystick"
	
func Enter() -> void:
	animated_sprite.play("attack")
	#print("Attack")
	
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
