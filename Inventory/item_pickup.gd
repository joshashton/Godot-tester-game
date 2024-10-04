class_name ItemPickup extends Area2D

@export var item_data :ItemData : set = _set_item_data

@onready var area_2d :Area2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(on_body_entered)

func _set_item_data(item):
	item_data = item
	
func on_body_entered(body):
	if body.is_in_group("knight"):
		if GlobalGameManager.INVENTORY_DATA.add_item(item_data) == true:
			item_picked_up()

func item_picked_up():
	area_2d.body_entered.disconnect(on_body_entered)
	print('added item')
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
