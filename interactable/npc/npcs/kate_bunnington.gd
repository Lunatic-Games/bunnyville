extends "res://interactable/npc/npc.gd"


func interact():
	var cookies_received: bool = ProgressManager.has_progression("COOKIES_GIVEN_TO_KATE")
	var has_flour: bool = InventoryManager.has_item("FLOUR")
	var has_cookies: bool = InventoryManager.has_item("COOKIES")
	
	if cookies_received:
		display_dialogue(["These cookies are delicious!"])
	elif has_cookies:
		display_dialogue(["Oh are these cookies from Mrs. Bunnsworth?"])
		display_action(["Ms. Bunnington takes the cookies."])
		InventoryManager.remove_item("COOKIES")
		ProgressManager.progression_achieved("COOKIES_GIVEN_TO_KATE")
		display_dialogue(["Oh these just look scrumptious, thank you!", "Oh before I forget, take this!",
		"I found it and thought it would be a good contribution."])
		display_item_received(["Ms. Bunnington gives you a carrot."], "CARROT")
		InventoryManager.add_carrot()
	elif has_flour:
		display_dialogue(["Would you be able to bring the flour to Mrs. Bunnsworth?"])
	else:
		display_dialogue(["Morning, Dear! Would you be able to bring this to Mrs. Bunnsworth across the path?"])
		display_item_received(["She gives you a bag of flour."], "FLOUR")
		InventoryManager.add_item("FLOUR")
