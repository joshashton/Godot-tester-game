extends Node
#base class/parent class
class_name State

var character : CharacterBody2D
@export var can_move : bool = true

signal transitioned(new_state_name: StringName)
 
func state_input(event: InputEvent):
	pass
	
func Enter() -> void:
	pass
	
func Exit() -> void:
	pass
