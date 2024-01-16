extends Node
#changes states
class_name ArcherStateMachine

@export var initial_state : State

@export var character : CharacterBody2D
@export var current_state : State
var startingShootPosition
#var shooting

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
	#print("statemachine event")
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var attackMouse = character.get_local_mouse_position()
				startingShootPosition = get_mouse_direction(attackMouse)
				#print(startingShootPosition)
	if current_state:
		current_state.Unhandled_input(event)
	
func get_mouse_direction(vector:Vector2) -> String:
	var angle = rad_to_deg(vector.angle())
	var shootPosition:String
	#print(angle)
	
	if (angle >= -90 && angle < -54):
		shootPosition = "up"
	elif (angle >= -54 && angle < -18):
		shootPosition = "upside"
	elif (angle >= -18 && angle < 18):
		shootPosition = "side"
	elif (angle >= 18 && angle < 54):
		shootPosition = "downside"
	elif(angle >= 54 && angle < 90):
		shootPosition = "down"
	elif (angle >= 90 && angle < 126):
		shootPosition = "flipdown"
	elif (angle >= 126 && angle < 162):
		shootPosition = "flipdownside"
	elif (angle >= -126 && angle < -90):
		shootPosition = "flipup"
	elif (angle >= -162 && angle < -126):
		shootPosition = "flipupside"
	else:
		shootPosition = "flipside"
	
	return(shootPosition)
		
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
