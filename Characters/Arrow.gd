extends Area2D
#class_name Weapon

var pushback_strength = 50
var speed = 500
var damage = 10

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += speed * direction * delta
	
func destroy():
	queue_free()
	
