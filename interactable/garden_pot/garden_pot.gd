extends "res://interactable/interactable.gd"


func _ready():
	update_monitoring()
	InventoryManager.connect("inventory_changed", self, "update_monitoring")
	if ProgressManager.flowers_planted.has(name):
		$Sprite.hide()
		$SpriteWithFlower.show()


func interact():
	if InventoryManager.has_item("FLOWERS"):
		monitoring = false
		$Sprite.hide()
		$SpriteWithFlower.show()
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, ["You place the flower in the pot."], false)
		InventoryManager.remove_item("FLOWERS")
		ProgressManager.progression_achieved("FLOWER_PLANTED")
		ProgressManager.mark_flower_planted(name)
		update_monitoring()


func update_monitoring():
	monitoring = InventoryManager.has_item("FLOWERS") and not ProgressManager.flowers_planted.has(name)
