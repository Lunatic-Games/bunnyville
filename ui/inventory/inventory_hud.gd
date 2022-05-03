extends Control


onready var items_container = $ItemInventory/Items


func _ready():
	var _ret = DialogueManager.connect("open_toggled", self, "_on_DialogueManager_open_toggled")
	_ret = InventoryManager.connect("inventory_changed", self, "update_item_slots")
	update_item_slots()


func _on_DialogueManager_open_toggled(dialogue_is_open: bool) -> void:
	visible = not dialogue_is_open


func update_item_slots() -> void:
	assert(InventoryManager.items.size() <= items_container.get_child_count())
	
	var i = 0
	for item_name in InventoryManager.items.keys():
		var quantity = InventoryManager.items[item_name]
		var icon = ItemManager.ITEMS[item_name]
		items_container.get_child(i).set_quantity(quantity)
		items_container.get_child(i).set_icon(icon)
		i += 1
	
	for index in range(i, items_container.get_child_count()):
		items_container.get_child(index).set_icon(null)
		items_container.get_child(index).set_quantity(0)
