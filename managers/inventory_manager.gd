extends Node


signal inventory_changed

var items: Dictionary = {}  # Item: quantity
var num_carrots = 0


func has_item(item_name: String, minimum_quantity: int = 1) -> bool:
	assert(ItemManager.ITEMS.has(item_name))
	return items.has(item_name) and items.get(item_name, 0) >= minimum_quantity


func add_item(item_name: String, quantity: int = 1) -> void:
	assert(ItemManager.ITEMS.has(item_name))
	items[item_name] = items.get(item_name, 0) + quantity
	emit_signal("inventory_changed")


func add_carrot(quantity: int = 1):
	num_carrots += quantity
	emit_signal("inventory_changed")


func remove_item(item_name: String, quantity: int = 1) -> void:
	assert(ItemManager.ITEMS.has(item_name))
	assert(items.get(item_name) >= quantity)
	items[item_name] = items[item_name] - quantity
	if items.get(item_name) == 0:
		var _had_item: bool = items.erase(item_name)
	emit_signal("inventory_changed")


func remove_all_of_item(item_name: String) -> void:
	assert(ItemManager.ITEMS.has(item_name))
	var _had_item: bool = items.erase(item_name)
	emit_signal("inventory_changed")


func get_amount_of_item(item_name: String) -> int:
	assert(ItemManager.ITEMS.has(item_name))
	return items.get(item_name, 0)


func reset_inventory() -> void:
	items = {}
	num_carrots = 0
