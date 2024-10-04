extends State
class_name SheepDeadState

@onready var statemachine = $".."
#@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var animated_sprite = $"../../AnimationPlayer"
@onready var lootdrop = statemachine.character.lootdrop

func Enter() -> void:
	animated_sprite.play("Dead")
	await animated_sprite.animation_finished
	#print("Sheep killed")
	dropLoot()
	# hide sheep
	#self.owner.queue_free()
	
func Exit() -> void:
	pass
	
func Update(delta):
	pass
		
func Unhandled_input(event):
	pass
	
func Physics_update(delta):
	pass

func dropLoot():
	#print("drop loot")
	
	lootdrop = lootdrop.instantiate()
	var parent = statemachine.character.get_parent()
		
# Add the new node to your scene's node tree.
	parent.add_child(lootdrop)

# Now change stuff related to the scene structure (like position)
	lootdrop.global_position = statemachine.character.global_position
	#$"../../Meat/AnimationPlayer".play("Spawn")
	#await $"../../Meat/AnimationPlayer".animation_finished
	#$"../../Meat/AnimationPlayer".play("Idle")
	#instantiate loot drop
	# unhide lootdrop - playe spawn animation - then idle
	statemachine.character.queue_free()
