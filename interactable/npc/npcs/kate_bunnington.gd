extends "res://interactable/npc/npc.gd"


func interact():
	var flour_received: bool = ProgressManager.has_progression("FLOUR_GIVEN_TO_MRS_BUNNSWORTH")
	var has_flour: bool = InventoryManager.has_item("FLOUR")
	
	if flour_received:
		display_dialogue(["Thanks for doing that!"])
	elif has_flour:
		display_dialogue(["Would you be able to bring the flour to Mrs. Bunnington?"])
	else:
		display_dialogue(["Hi, Dear. Would you be able to bring this to Mrs. Bunnington?"])
		display_action(["She gives you a bag of flour."])
		InventoryManager.add_item("FLOUR")
