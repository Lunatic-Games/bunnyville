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
		display_dialogue(["Thank you for those cattails!"])
	else:
		display_dialogue(["I'm looking for some cattails for a potion, I'll need 5 in total..."])
