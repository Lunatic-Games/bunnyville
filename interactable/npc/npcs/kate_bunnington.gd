extends "res://area/interactable/interactable.gd"


func interact():
	var flour_received: bool = ProgressManager.has_progression("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
	var has_flour: bool = InventoryManager.has_item("FLOUR")
	
	if flour_received:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, ["Thanks for doing that!"])
	elif has_flour:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, ["Would you be able to bring the flour to Mrs. Bunnington?"])
	else:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, ["Hi, Dear. Would you be able to bring this to Mrs. Bunnington?"])
		DialogueManager.queue_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, ["She gives you a bag of flour."])
		InventoryManager.add_item("FLOUR")
