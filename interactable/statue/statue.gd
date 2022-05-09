extends "res://interactable/interactable.gd"

signal carrots_placed

const NUM_CARROTS_REQUIRED: int = 5


func interact():
	if InventoryManager.num_carrots >= NUM_CARROTS_REQUIRED:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, ["You place the carrots on the alter."])
		$Sprite.hide()
		$SpriteWithCarrots.show()
		yield(DialogueManager, "finished")
		emit_signal("carrots_placed")
	else:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.FULL, ["A statue in honor of Mr. Bunnington, the founder of Bunnyville. There is an altar where carrots are often placed in his memory."])
