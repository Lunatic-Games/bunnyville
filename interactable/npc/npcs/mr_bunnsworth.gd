extends "res://interactable/npc/npc.gd"


func interact():
	if InventoryManager.has_item("MONOCLE"):
		display_dialogue(["Oh you found my precious monocle!"])
		display_action(["Mr. Bunnsworth takes the monocle."])
		InventoryManager.remove_item("MONOCLE")
		ProgressManager.progression_achieved("MONOCLE_GIVEN_TO_MR_BUNNSWORTH")
		display_dialogue(["I had been looking all over for that, thank you!", "Take this for your troubles."])
		display_action(["Mr. Bunnsworth gives you a shovel."])
		InventoryManager.add_item("SHOVEL")
		display_dialogue(["I find it very helpful for digging up plants!"])
	elif ProgressManager.progression_achieved("MONOCLE_GIVEN_TO_MR_BUNNSWORTH"):
		display_dialogue(["Do I look more sophisticated now?"])
	else:
		display_dialogue(["I lost my monocle, but I can't find it because I can't see!", "It's a vicious cycle..."])
