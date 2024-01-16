extends Node
#changes states
class_name PlayerStateMachine

@export var initial_state : State

@export var character : CharacterBody2D
@export var current_state : State
var attackPosition

#var states : Array[State]
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if (child is State):
			#states.append(child)
			states[child.name.to_lower()] = child
			
			child.character = character
			child.Transitioned.connect(on_child_transitioned)
		else:
			push_warning(child.name+" is not a state")
	if initial_state:
		initial_state.Enter()
		current_state = initial_state
			
func _process(delta):
	if current_state:
		current_state.Update(delta)
		
func _physics_process(delta):
	if current_state:
		current_state.Physics_update(delta)
		
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				#update mouse location for attack
# Get the mouse position in the world
				var attackMouse = character.get_local_mouse_position()
				attackPosition = get_mouse_direction(attackMouse)
				print(attackPosition)
				#get_global_mouse_position()
				#print("click position: ", attackPosition)
				#print("click position2: ", event.position)
				#print("player position: ", character.global_position)
				#print("player position2: ", character.get_local_mouse_position())
				#print(global_position.x)

	if current_state:
		current_state.Unhandled_input(event)
		
# Function to get direction based on angle
func get_mouse_direction(vector:Vector2):
	#if vector.x> 0:
		#return "right"
	#else:
		#return "left"
		#-3 - 0
		
	var angle = rad_to_deg(vector.angle())
	print(angle)
	if angle >= -45.0 && angle < 45.0:
		return "right"
	elif angle >= 45.0 && angle < 135.0:
		return "down"
	elif angle >= -135.0 && angle < -45.0:
		return "up"
	else:
		return "left"
	
	
	
func on_child_transitioned(state,new_state_name) -> void:
	if state != current_state:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
		
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	
	current_state = new_state
