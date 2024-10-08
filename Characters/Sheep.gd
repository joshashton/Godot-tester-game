extends CharacterBody2D

signal self_damaged()

var speed = 50
var health = 20
var isDead : bool = false
var lootdrop = preload("res://Inventory/meat.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Hitbox.Damaged.connect(take_damage)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage):
	health -= damage
	print(health)
	if health <=0:
		isDead = true
	self_damaged.emit()
	
func _on_hitbox_area_entered(area):
	print("Hit sheep")
	if area.is_in_group("Projectile") or area.is_in_group("weapon"):
		take_damage(area.damage)
		
