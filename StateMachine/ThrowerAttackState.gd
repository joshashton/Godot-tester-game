extends State

@onready var anim_player = $"../../AnimationPlayer"
@onready var playerFSM = $".."

func Enter() -> void:
	#print("attack state")
	anim_player.play("attack")
	
func Exit() -> void:
	pass
	
func Update(delta):
	pass
	
func Physics_update(delta):
	pass
	
func Unhandled_input(event):
	pass
