extends "res://interactable/npc/npc.gd"


func interact():
	if InventoryManager.has_item("HAMMER"):
		display_dialogue(["Oh is this the hammer I lost? Thank you so much!"])
		display_action(["Drew Bunz takes the hammer."])
		InventoryManager.remove_item("HAMMER")
		display_dialogue(["Here, take this. It's some unused rope from a construction job. Maybe you can find a use for it?"])
		InventoryManager.add_item("ROPE")
		ProgressManager.progression_achieved("HAMMER_GIVEN_TO_JOHN_BUNZ")
	elif ProgressManager.has_progression("HAMMER_GIVEN_TO_JOHN_BUNZ"):
		display_dialogue(["Thank you for finding my hammer!"])
	else:
		display_dialogue(["I can't seem to figure out where I misplaced my hammer..."])
