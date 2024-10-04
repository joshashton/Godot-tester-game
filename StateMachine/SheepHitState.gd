extends State
class_name SheepHitState

@onready var animated_sprite = $"../../AnimationPlayer"
var movement_direction: Vector2

var max_plays 


func Enter() -> void:
	animated_sprite.play("Hit")
	await animated_sprite.animation_finished
	Transitioned.emit(self, "Bounce")
	
func Exit() -> void:
	pass
	
func Update(delta):
	
	if character.isDead == true:
		Transitioned.emit(self, "Die")
		
func Unhandled_input(event):
	pass
	
func Physics_update(delta):
	pass
	
