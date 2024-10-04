extends State
class_name SheepIdleState

#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"

func Enter() -> void:
	animated_sprite.play("Idle")
	#print("Idlesheep")
	$"../../Timer".start()
	
	# sheep signal
	character.self_damaged.connect(take_damage)
	
func Exit() -> void:
	pass
	
func Update(delta):
	
	if character.isDead == true:
		Transitioned.emit(self, "Die")
		
func Unhandled_input(event):
	pass
	
func Physics_update(delta):
	pass


func _on_timer_timeout() -> void:
	Transitioned.emit(self, "Bounce")
	
func take_damage():
	#print('idle signal damage')
	Transitioned.emit(self, "Hit")
