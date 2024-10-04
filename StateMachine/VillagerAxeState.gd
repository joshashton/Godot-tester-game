extends State

@onready var anim_player = $"../../AnimationPlayer"
@onready var playerFSM = $".."

func Enter() -> void:
	anim_player.play("chopping")
	#print("IdleState")
	print(character.hit_range[0])
	
func Exit() -> void:
	pass
	
func Update(delta):
	pass
	
		
func Unhandled_input(event):
	pass
			
func Physics_update(delta):
	pass
