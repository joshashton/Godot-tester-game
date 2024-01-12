extends Node
#base class/parent class
class_name State

var character : CharacterBody2D
@export var can_move : bool = true

signal Transitioned(state: State, new_state_name: StringName)
 
#virual functions
#func state_input(event: InputEvent):
#	pass
	
func Enter() -> void:
	pass
	
func Exit() -> void:
	pass
	
func Update(delta):
	pass
	
func Physics_update(delta):
	pass
	
func Unhandled_input(event):
	pass
