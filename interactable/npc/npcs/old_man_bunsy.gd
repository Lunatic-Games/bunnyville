extends "res://interactable/npc/npc.gd"


func interact():
	if ProgressManager.has_progression("WORMS_GIVEN_TO_BUNSY"):
		display_dialogue(["When you gave me this bait you sure opened a can of worms! Haha!"])
	elif InventoryManager.has_item("WORMS"):
		display_dialogue(["Oh these are from Ms. Bunsprout? She is too kind! Thank you for bringing these to me!"])
		display_action(["Old Man Bunsy takes the can of worms."])
		InventoryManager.remove_item("WORMS")
		ProgressManager.progression_achieved("WORMS_GIVEN_TO_BUNSY")
		display_dialogue(["Take this for your troubles!"])
		display_item_received(["Old Many Bunsy gives you a carrot."], "CARROT")
		InventoryManager.add_carrot()
	else:
		display_dialogue(["Hm, the fish sure aren't biting today... Maybe I just need the right bait?"])
