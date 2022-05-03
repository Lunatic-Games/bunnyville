extends "res://interactable/npc/npc.gd"


func interact():
	if InventoryManager.has_item("BLUEPRINTS"):
		display_dialogue(["Oh are these the blueprints I lost? Thank you so much!"])
		display_action(["Drew Bunz takes the blueprints."])
		InventoryManager.remove_item("BLUEPRINTS")
		display_dialogue(["Here, take this. This was my grandfather's sword. Maybe you can give it to a hero who needs it?"])
		InventoryManager.add_item("SWORD")
		ProgressManager.progression_achieved("BLUEPRINTS_GIVEN_TO_DREW_BUNZ")
	elif ProgressManager.has_progression("BLUEPRINTS_GIVEN_TO_DREW_BUNZ"):
		display_dialogue(["Thank you for finding my blueprints!"])
	else:
		display_dialogue(["I can't seem to figure out where I misplaced my blueprints..."])
