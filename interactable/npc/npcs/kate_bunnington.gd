extends "res://interactable/npc/npc.gd"


func interact():
	var cookies_received: bool = ProgressManager.has_progression("COOKIES_GIVEN_TO_KATE")
	var has_flour: bool = InventoryManager.has_item("FLOUR")
	var has_cookies: bool = InventoryManager.has_item("COOKIES")
	
	if cookies_received:
		display_dialogue(["These cookies are delicious!"])
	elif has_cookies:
		display_dialogue(["Oh are these cookies from Mrs. Bunnington?"])
		display_action(["Kate takes the cookies."])
		InventoryManager.remove_item("COOKIES")
		ProgressManager.progression_achieved("COOKIES_GIVEN_TO_KATE")
		display_dialogue(["Oh these just look scrumptious, thank you!", "Oh before I forget, take this!",
		"I found this and thought you could use it."])
		display_action(["Kate gives you a carrot."])
		InventoryManager.add_carrot()
	elif has_flour:
		display_dialogue(["Would you be able to bring the flour to Mrs. Bunnington?"])
	else:
		display_dialogue(["Hi, Dear. Would you be able to bring this to Mrs. Bunnington?"])
		display_action(["She gives you a bag of flour."])
		InventoryManager.add_item("FLOUR")
