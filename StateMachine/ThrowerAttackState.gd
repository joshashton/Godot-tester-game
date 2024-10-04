extends State

@onready var anim_player = $"../../AnimationPlayer"
@onready var playerFSM = $".."

func Enter() -> void:
	#print("attack state")
	anim_player.play("attack")
	await anim_player.animation_finished
	Transitioned.emit(self, "Idle")
	
func Exit() -> void:
	pass
	
func Update(delta):
	if character.isDead == true:
		Transitioned.emit(self, "Die")
	
func Physics_update(delta):
	pass
	
func Unhandled_input(event):
	pass
