extends "res://interactable/interactable.gd"


func interact():
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.FULL, ["A statue in honor of Mr. Bunnington, the founder of Bunnyville. There is an altar where carrots are often placed in his memory."], false)
