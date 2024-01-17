extends RigidBody2D

var pushback_strength = 50
var velocity = 500

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += velocity * direction * delta
	
func destroy():
	queue_free()

