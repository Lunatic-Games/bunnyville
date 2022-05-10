extends "res://interactable/npc/npc.gd"


const CATTAILS_NEEDED = 5


func interact():
	if InventoryManager.has_item("CATTAIL", CATTAILS_NEEDED):
		display_dialogue(["Oh are these cattails for me? Thank you so much!"])
		display_action(["Bunnatrix takes the cattails."])
		InventoryManager.remove_all_of_item("CATTAIL")
		display_dialogue(["Here, take this for your troubles."])
		display_item_received(["Bunnatrix gives you a carrot."], "CARROT")
		InventoryManager.add_carrot()
		ProgressManager.progression_achieved("CATTAILS_GIVEN_TO_BUNNATRIX")
	elif ProgressManager.has_progression("CATTAILS_GIVEN_TO_BUNNATRIX"):
		display_dialogue(["I can’t remember... Am I supposed to finely chop the cattails or add them to the cauldron whole...?", "This whole potion brewing thing is harder than it looks!"])
	else:
		display_dialogue(["Do you think you could find me some cattails? I need them for a potion I’m brewing. I'll need 5 in total..."])
