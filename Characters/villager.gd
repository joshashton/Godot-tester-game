extends CharacterBody2D
@onready var sprite = $Sprite2D
@onready var hitrange = $HitRange
var pressed = false

var tree_range = []
var hit_range 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_touch_screen_button_pressed() -> void:
	pressed = true 
	print(pressed)
	sprite.modulate = Color(0, 0, 1) # blue shade
	
	#sprite.modulate = Color(1, 1, 1) # blue shade


func _on_hit_range_body_entered(body: Node2D) -> void:
	if body.is_in_group('Tree'):
		hit_range = body
		#print('hit_range'+ hit_range)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('Tree'):
		tree_range.append(body)
		#print(tree_range)
