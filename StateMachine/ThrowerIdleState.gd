extends State

@onready var anim_player = $"../../AnimationPlayer"
@onready var playerFSM = $".."

func Enter() -> void:
	anim_player.play("idle")
	#print("IdleState")
	
func Exit() -> void:
	pass
	
func Update(delta):
	if character.isDead == true:
		Transitioned.emit(self, "Die")
	
	if playerFSM.nearbyEnemies:
		Transitioned.emit(self, "Run")# towards player - set auto navigation agent 
	
		
func Unhandled_input(event):
	pass
			
func Physics_update(delta):
	pass

func _on_attack_range_body_entered(body):
	if body.is_in_group("knight"):	
		playerFSM.focusedEnemy = body
		Transitioned.emit(self, "Attack")
