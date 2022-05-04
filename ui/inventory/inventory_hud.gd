extends Control


onready var items_container = $ItemInventory/Items
onready var carrot_container = $CarrotInventory/NinePatchRect/MarginContainer/Carrots


func _ready():
	var _ret = DialogueManager.connect("open_toggled", self, "_on_DialogueManager_open_toggled")
	_ret = InventoryManager.connect("inventory_changed", self, "update_item_slots")
	_ret = InventoryManager.connect("inventory_changed", self, "update_carrots")
	update_item_slots()
	update_carrots()


func _on_DialogueManager_open_toggled(dialogue_is_open: bool) -> void:
	visible = not dialogue_is_open


func update_item_slots() -> void:
	assert(InventoryManager.items.size() <= items_container.get_child_count())
	
	var i = 0
	for item_name in InventoryManager.items.keys():
		var quantity: int = InventoryManager.items[item_name]
		var icon: Texture = ItemManager.ITEMS[item_name]
		var item_slot: ItemSlot = items_container.get_child(i)
		
		item_slot.set_popup_text(ItemManager.DISPLAY_NAMES[item_name])
		item_slot.set_quantity(quantity)
		item_slot.set_icon(icon)
		i += 1
	
	for index in range(i, items_container.get_child_count()):
		var item_slot: ItemSlot = items_container.get_child(index)
		item_slot.set_popup_text("")
		item_slot.set_icon(null)
		item_slot.set_quantity(0)


func update_carrots() -> void:
	assert(InventoryManager.num_carrots <= carrot_container.get_child_count())
	
	var max_num_of_carrots: int = carrot_container.get_child_count()
	
	for i in carrot_container.get_child_count():
		carrot_container.get_child(max_num_of_carrots - 1 - i).set_collected(i < InventoryManager.num_carrots)
