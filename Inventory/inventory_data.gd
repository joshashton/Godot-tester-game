class_name InventoryData extends Resource

signal inventory_updated()


@export var slots: Array[SlotData]


func add_item(item):
	print("added")
	for s in slots:
		if s:
			if s.item_data == item:
				
				s.quantity += 1
				inventory_updated.emit()
				return true
	print('didnt add')
	return false 
