extends Node

class_name PlayerStateMachine

@export var character : CharacterBody2D
@export var current_state : State

var states : Array[State]

func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)
			child.character = character
		else:
			push_warning(child.name+" is not a state")
			
func _process(delta):
	current_state.Update(delta)
		
func _physics_process(delta):
	current_state.Physics_update(delta)
	
func on_child_transitioned(new_state_name: StringName) -> void:
	
