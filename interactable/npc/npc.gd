extends "res://interactable/interactable.gd"


export (String) var title

onready var portrait = $Sprite.texture


# Put into a function for easier calling
func display_dialogue(dialogue: Array):
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, 
		dialogue, true, portrait, title)


func display_action(dialogue: Array):
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, dialogue, false) 


func display_item_received(dialogue: Array, item_name: String):
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.ITEM, dialogue, false,
		ItemManager.ITEMS[item_name])
