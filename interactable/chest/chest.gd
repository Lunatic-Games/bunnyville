extends "res://interactable/interactable.gd"


export (String) var item_contained
export (bool) var locked = false
export (String, MULTILINE) var unlock_text


func _ready():
	if ProgressManager.chests_opened.has(name) or not item_contained:
		show_opened()


func interact():
	if locked:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, ["It is locked..."], false)
	else:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.ITEM, [unlock_text], false, ItemManager.ITEMS[item_contained])
		if item_contained:
			InventoryManager.add_item(item_contained)
			ProgressManager.mark_chest_opened(name)
		show_opened()


func show_opened():
	$Closed.visible = false
	$Opened.visible = true
	monitoring = false
