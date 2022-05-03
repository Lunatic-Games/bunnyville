extends "res://interactable/npc/npc.gd"


func interact():
	var has_flour: bool = InventoryManager.has_item("FLOUR")
	var flour_received: bool = ProgressManager.has_progression("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
	
	if flour_received:
		display_dialogue(["I hope Mrs. Bunnington enjoys the cookies!"])
	elif has_flour:
		display_dialogue(["Oh is this from Kate Bunnington? Thank you!"])
		display_action(["She takes the bag of flour."])
		InventoryManager.remove_all_of_item("FLOUR")
		ProgressManager.progression_achieved("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
		display_dialogue(["Here, take these back to Mrs. Bunnington."])
		display_action(["She gives you some freshly baked cookies."])
		InventoryManager.add_item("COOKIES")
	else:
		display_dialogue(["Hm, I wanted to do some baking but I'm all out of flour..."])
