extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	const LAYER_10 = 1 << 9 # Layer 10 is the 10th bit (1 << 9).
	const LAYER_11 = 1 << 10 # Layer 11 is the 11th bit (1 << 10).
	# First, get the current collision mask of the body.
	var current_mask = body.get_collision_mask()
	current_mask &= ~LAYER_10
	current_mask |= LAYER_11
	# Set the modified mask back to the body.
	body.set_collision_mask(current_mask)

	print('layer 1')
	print('set z index = 2')
	body.z_index = 2



func _on_down_stairs_body_entered(body: Node2D) -> void:
	const LAYER_10 = 1 << 9 # Layer 10 is the 10th bit (1 << 9).
	const LAYER_11 = 1 << 10 # Layer 11 is the 11th bit (1 << 10).
	
	var current_mask = body.get_collision_mask()
	current_mask &= ~LAYER_11
	current_mask |= LAYER_10
	# Set the modified mask back to the body.
	body.set_collision_mask(current_mask)
	
	print('layer 0')
	print('set z index = 1')
	body.z_index = 1
	
	
func _on_stairs_2_body_entered(body: Node2D) -> void:
	
	const LAYER_12 = 1 << 11 # Layer 10 is the 10th bit (1 << 9).
	const LAYER_11 = 1 << 10 # Layer 11 is the 11th bit (1 << 10).
	# First, get the current collision mask of the body.
	var current_mask = body.get_collision_mask()
	current_mask &= ~LAYER_11
	current_mask |= LAYER_12
	# Set the modified mask back to the body.
	body.set_collision_mask(current_mask)

	print('set z index = 3') # 1 above layer z
	body.z_index = 3

func _on_down_stairs_2_body_entered(body: Node2D) -> void:
	const LAYER_12 = 1 << 11 # Layer 10 is the 10th bit (1 << 9).
	const LAYER_11 = 1 << 10 # Layer 11 is the 11th bit (1 << 10).
	
	var current_mask = body.get_collision_mask()
	current_mask &= ~LAYER_12
	current_mask |= LAYER_11
	# Set the modified mask back to the body.
	body.set_collision_mask(current_mask)
	
	print('layer 1')
	print('set z index = 2')
	body.z_index = 2
