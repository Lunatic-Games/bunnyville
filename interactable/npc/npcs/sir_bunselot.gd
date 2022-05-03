extends "res://interactable/npc/npc.gd"


export (bool) var by_tower


func _ready():
	if not by_tower and ProgressManager.has_progression("SWORD_GIVEN_TO_SIR_BUNSELOT"):
		queue_free()
	elif by_tower and not ProgressManager.has_progression("SWORD_GIVEN_TO_SIR_BUNSELOT"):
		queue_free()


func interact():
	if ProgressManager.has_progression("RABUNZEL_DOWN_FROM_TOWER"):
		display_dialogue(["I sure feel like a knight now! And all thanks to you!"])
	
	elif InventoryManager.has_item("ROPE") and by_tower:
		display_dialogue(["Oh you found some rope!"])
		display_action(["Sir Bunselot takes the rope."])
		InventoryManager.remove_item("ROPE")
		display_dialogue(["Now with just the right amount of spin..."])
		display_action(["Sir Bunselot throws the rope up the tower."])
		display_dialogue(["Taadaa! You can come on down now, Rabunzel!"])
		ProgressManager.progression_achieved("RABUNZEL_DOWN_FROM_TOWER")
	
	elif ProgressManager.has_progression("SWORD_GIVEN_TO_SIR_BUNSELOT"):
		if by_tower:
			display_dialogue(["I'm not sure how to get here down without some rope..."])
		else:
			display_dialogue(["I'll meet you by the tower!"])
			
	elif InventoryManager.has_item("SWORD"):
		display_dialogue(["How am I supposed to be a knight of the realm when I don't even have a sword?", "What's this? I can this sword?",
			"Oh you don't know how much this means to me! Thank you!"])
		display_action(["Sir Bunselot takes the sword."])
		InventoryManager.remove_item("SWORD")
		ProgressManager.progression_achieved("SWORD_GIVEN_TO_SIR_BUNSELOT")
		display_dialogue(["Here, take this for your troubles."])
		display_action(["Sir Bunselot gives you a carrot."])
		InventoryManager.add_carrot()
		display_dialogue(["I better get over to the tower now! I hear there is a princess in distress!"])
		
	else:
		display_dialogue(["How am I supposed to be knight of the realm when I don't even have a sword?"])
