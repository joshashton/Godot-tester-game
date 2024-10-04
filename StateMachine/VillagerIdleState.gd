extends State

@onready var anim_player = $"../../AnimationPlayer"
@onready var playerFSM = $".."

func Enter() -> void:
	anim_player.play("idle")
	
func Exit() -> void:
	pass
	
func Update(delta):
	pass
	
func Unhandled_input(event):
	pass
			
func Physics_update(delta):
	if character.pressed:
		tree_range()

func tree_range():
	Transitioned.emit(self, "Looting")
