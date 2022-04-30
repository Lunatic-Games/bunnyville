extends "res://area/interactable/npcs/npc.gd"


func interact():
	var has_flour: bool = InventoryManager.has_item("FLOUR")
	var flour_received: bool = ProgressManager.has_progression("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
	
	if flour_received:
		display_dialogue(["I better preheat the oven now...", "Wait, do I even have an oven?"])
	elif has_flour:
		display_dialogue(["Oh is this from Kate Bunnington? Thank you!"])
		queue_dialogue(["She takes the bag of flour."])
		InventoryManager.remove_all_of_item("FLOUR")
		ProgressManager.progression_achieved("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
	else:
		display_dialogue(["Hm, I wanted to do some baking but I'm all out of flour..."])
