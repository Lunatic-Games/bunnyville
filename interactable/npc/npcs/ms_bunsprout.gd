extends "res://interactable/npc/npc.gd"


const FLOWERS_TO_PLANT = 5


func interact():
	if ProgressManager.has_progression("WORMS_GIVEN_TO_BUNSY") or InventoryManager.has_item("WORMS"):
		display_dialogue(["I hope Old Man Bunsy makes good use of those worms!"])
	elif ProgressManager.count_progressions("FLOWER_PLANTED") >= FLOWERS_TO_PLANT:
		display_dialogue(["Oh you planted all of the flowers I gave you? Thank you so much!",
		"I hope the others enjoy them!", "Oh while you are here, do you think you could take these worms to Old Man Bunsy? They make great bait!"])
		display_item_received(["Ms. Bunsprout gives you a can of worms."], "WORMS")
		InventoryManager.add_item("WORMS")
	elif InventoryManager.has_item("FLOWERS"):
		display_dialogue(["If you could plant those flowers around the town, I would greatly appreciate it!"])
	else:
		display_dialogue(["Hi there! Do you think you could plant these flowers around the town?"])
		display_item_received(["Ms. Bunsprout gives you some flowers."], "FLOWERS")
		InventoryManager.add_item("FLOWERS", FLOWERS_TO_PLANT)
		display_dialogue(["There are some empty garden pots scattered around that would make a great home for them!", "Don't forget about Old Man Bunsy! He lives just south of the town center."])
		
