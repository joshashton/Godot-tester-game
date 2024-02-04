extends State

@onready var anim_player = $"../../AnimationPlayer"
@onready var playerFSM = $".."

func Enter() -> void:
	anim_player.play("idle")
	print("IdleState")
	
func Exit() -> void:
	pass
	
func Update(delta):
	pass
		
func Unhandled_input(event):
	pass
			
func Physics_update(delta):
	pass

func _on_detection_radius_body_entered(body):
	if body.is_in_group("knight"):	
		playerFSM.detectedBody = body
		Transitioned.emit(self, "Run")


func _on_attack_range_body_entered(body):
	if body.is_in_group("knight"):	
		playerFSM.detectedBody = body
		Transitioned.emit(self, "Attack")
