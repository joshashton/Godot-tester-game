extends State
class_name ArcherIdleState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
	
func Enter() -> void:
	animated_sprite.play("idle")
	print("IdleState")
	
func Exit() -> void:
	pass
	
func Update(delta):
	if (Input.get_vector("move_left", "move_right", "move_up", "move_down")):
		Transitioned.emit(self, "Run")
		
	var attack_vector = Vector2.ZERO
	attack_vector = Input.get_vector("attack_left","attack_right","attack_up","attack_down")
	if attack_vector:
		#print("attack")
		Transitioned.emit(self, "Shoot")
		
func Unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				#print("Left button was clicked at ", event.position)
				#rotate player to hit mouse area
				#then attack animation
				
				Transitioned.emit(self, "Shoot")
			else:
				pass
				#print("Left button was released")
			
	
func Physics_update(delta):
	pass
