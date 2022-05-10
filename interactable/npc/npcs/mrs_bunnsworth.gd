extends "res://interactable/npc/npc.gd"


func interact():
	var has_flour: bool = InventoryManager.has_item("FLOUR")
	var flour_received: bool = ProgressManager.has_progression("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
	
	if flour_received:
		display_dialogue(["I hope Ms. Bunnington enjoys the cookies!"])
	elif has_flour:
		display_dialogue(["Oh is this from Ms. Bunnington? Thank you!"])
		display_action(["She takes the bag of flour."])
		InventoryManager.remove_all_of_item("FLOUR")
		ProgressManager.progression_achieved("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
		display_dialogue(["Here, take these back to her, I just baked them this morning!"])
		display_item_received(["She gives you some freshly baked cookies."], "COOKIES")
		InventoryManager.add_item("COOKIES")
	else:
		display_dialogue(["Hm, I wanted to do some more baking but I used up the rest of my flour..."])
