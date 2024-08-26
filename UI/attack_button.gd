extends TouchScreenButton

@onready var touched = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventScreenTouch:
		#print("touched")
		if self.is_pressed():
			#print("touched")
			touched = true
		elif not event.pressed:
			touched = false
