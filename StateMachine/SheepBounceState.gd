extends State
class_name SheepBounceState

@onready var animated_sprite = $"../../AnimationPlayer"
var movement_direction: Vector2

var max_plays 

# Called when the state is entered
func Enter() -> void:
	character.self_damaged.connect(take_damage)
	# Set a random movement direction
	movement_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	max_plays = randf_range(1,6)  # Set how many times you want the animation to play
	# Play the bounce animation based on direction
	if movement_direction.x < 0:
		animated_sprite.play("lBounce")  # Moving left
	else:
		animated_sprite.play("Bounce")  # Moving right or other directions
	#print('bounce state sheep')
	#print(max_plays)
	$"../../Timer2".wait_time = max_plays
	$"../../Timer2".start()
		

func Update(delta):
	# If the character dies during this state, transition to "Die" state
	if character.isDead:
		Transitioned.emit(self, "Die")
		
func Physics_update(delta):
	# Call move_and_slide on the character to make it move
	character.velocity = movement_direction * character.speed
	character.move_and_slide()


func _on_timer_2_timeout() -> void:
	#print('timmer')
	Transitioned.emit(self, "Idle")
	
func take_damage():
	#print('signal damage')
	Transitioned.emit(self, "Hit")
