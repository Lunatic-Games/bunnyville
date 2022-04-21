extends "res://area/interactable/interactable.gd"


func interact():
	var has_flour: bool = InventoryManager.has_item("FLOUR")
	var flour_received: bool = ProgressManager.has_progression("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
	
	if flour_received:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, ["I better preheat the oven now...", "Wait, do I even have an oven?"])
	elif has_flour:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, ["Oh is this from Kate Bunnington? Thank you!"])
		DialogueManager.queue_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, ["She takes the bag of flour."])
		InventoryManager.remove_all_of_item("FLOUR")
		ProgressManager.progression_achieved("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
	else:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, ["Hm, I wanted to do some baking but I'm all out of flour..."])
