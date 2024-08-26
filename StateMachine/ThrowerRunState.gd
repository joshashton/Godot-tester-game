extends State

@onready var anim_player = $"../../AnimationPlayer"
@onready var playerFSM = $".."
@onready var anim_sprite = $"../../Sprite2D"
var speed = 20
var target_position

func Enter() -> void:
	print("run state")
	anim_player.play("run")
	
func Exit() -> void:
	pass
	
func Update(delta):
	if playerFSM.nearbyEnemies.is_empty():
		Transitioned.emit(self, "Idle")
	
func Physics_update(delta):
	
	if !playerFSM.nearbyEnemies.is_empty():
		var player_position = playerFSM.nearbyEnemies[0].position
		target_position = (player_position - character.position).normalized()
		move(target_position)
	
func Unhandled_input(event):
	pass

func move(target_position):
	update_facing_direction()
	character.velocity = target_position * speed
	character.move_and_slide()
	
func update_facing_direction():
	if target_position.x >0:
		anim_sprite.flip_h = false
	elif target_position.x <0:
		anim_sprite.flip_h = true


func _on_attack_range_body_entered(body):

	if body.is_in_group("knight"):	
		playerFSM.focusedEnemy = body
		Transitioned.emit(self, "Attack")

