extends Node
#changes states
class_name GoblinStateMachine

@export var initial_state : State
@export var character : CharacterBody2D
@export var current_state : State

var states : Dictionary = {}

var focusedEnemy
var nearbyEnemies : Array
@onready var navigationAgent = $"../NavigationAgent2D"

func _ready():
	for child in get_children():
		if (child is State):
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
	if current_state:
		current_state.Unhandled_input(event)
	
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

func _on_detection_radius_body_entered(body):
	# add body to enemy array if enemy
	#if body is knight:
	#	nearbyEnemies.append(body)
	if body.is_in_group("knight"):
		nearbyEnemies.append(body)
	focusedEnemy = body


func _on_detection_radius_body_exited(body):
	# remove enemy from array if in it 
	if body in nearbyEnemies:
		nearbyEnemies.erase(body)
		
	
	pass # Replace with function body.
