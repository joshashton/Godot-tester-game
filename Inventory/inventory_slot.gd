class_name InventorySlotUI extends Control

var slot_data = SlotData : set = set_slot_data

@onready var texture_rect = $TextureRect
@onready var label = $Label
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	texture_rect.texture = null
	label.text = ''

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_slot_data(value : SlotData):
	slot_data = value
	if slot_data == null:
		return 
	texture_rect.texture = slot_data.item_data.texture
	label.text = str(slot_data.quantity)
	
