class_name InventoryUI extends Control

const INVENTORY_SLOT = preload("res://Inventory/inventory_slot.tscn")

#@export var data : InventoryData
# get inventory from static script
var data = GlobalPlayer.INVENTORY_DATA

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data.inventory_updated.connect(update_inventory)
	update_inventory()
	

func clear_inventory():
	for c in get_children():
		c.queue_free()

func update_inventory():
	clear_inventory()
	for s in data.slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		add_child(new_slot)
		new_slot.slot_data = s
