extends State

@onready var anim_player = $"../../AnimationPlayer"
@onready var playerFSM = $".."
@onready var navagent = $"../../NavigationAgent2D"
var speed = 100

func Enter() -> void:
	anim_player.play("run")
	#print("IdleState")
	print(character.tree_range[0])
	navagent.path_desired_distance = 20
	navagent.target_desired_distance = 20
	
	# make this the location above the tree 
	navagent.target_position = character.tree_range[0].global_position
	
	
func Exit() -> void:
	pass
	
func Update(delta):
	if character.hit_range:
		Transitioned.emit(self, "Axe")
	
		
func Unhandled_input(event):
	pass
			
func Physics_update(delta):
	
	# Get the position of the tree
	var axis = (navagent.get_next_path_position() - character.global_position).normalized()
	character.velocity = axis * speed
	
	character.move_and_slide()
	
	if navagent.is_navigation_finished():
		anim_player.play("idle")

	
# Method to move toward the tree
func move_toward_tree(tree_position: Vector2, delta: float) -> void:
	# Calculate the direction towards the tree
	var direction = (tree_position - character.global_position).normalized()

	# Apply movement (adjust speed as needed)
	var speed = 100.0  # Speed of the villager
	character.velocity = direction * speed

	# Move the villager
	character.move_and_slide()
