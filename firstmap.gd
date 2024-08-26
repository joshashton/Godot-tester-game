extends Node2D

# state machine knights
var player_knight_scene = load("res://Scenes/PlayableCharacter/PlayableKnight.tscn")
# satte machine archer
var player_archer_scene = load("res://Scenes/PlayableCharacter/PlayableArcher.tscn")

# state machine archer
# archer
@onready var archer = get_node("Archer")
# knight
@onready var knight = get_node("Knight")


@onready var spawn = $playerspawn

var player_cam : Camera2D
var playerknight
var playerarcher


# Called when the node enters the scene tree for the first time.
func _ready():
	# Instantiate the knight and add the camera as its child
	playerknight = player_knight_scene.instantiate()
	player_cam = Camera2D.new()
	if playerknight:
		
		
		playerknight.position = spawn.position
		# Add the knight to the scene tree
		add_child(playerknight)
		playerknight.add_child(player_cam)	
		# Hide the original knight node
		knight.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	#toggle player character
	# if knight: changge to archer 
	# else
	if archer.visible:
		playerknight.queue_free()  # This will schedule the instance for deletion
		playerknight.remove_child(player_cam)
		
		playerarcher = player_archer_scene.instantiate()
		
		# Set the position of the new player to the marker position
		playerarcher.position = spawn.position
		add_child(playerarcher)
		
		playerarcher.add_child(player_cam)	
		archer.visible = false
		knight.visible = true
	elif knight.visible:
		playerarcher.queue_free()  # This will schedule the instance for deletion
		playerarcher.remove_child(player_cam)
		
		playerknight = player_knight_scene.instantiate()
		
		# Set the position of the new player to the marker position
		playerknight.position = spawn.position
		add_child(playerknight)
		playerknight.add_child(player_cam)
		
		knight.visible = false
		archer.visible = true
		
	
