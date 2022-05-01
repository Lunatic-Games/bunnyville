extends "res://interactable/interactable.gd"


export (String) var title

onready var portrait = $Sprite.texture


# Put into a function for easier calling
func display_dialogue(dialogue: Array):
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, 
		dialogue, portrait, title)


func display_action(dialogue: Array):
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, dialogue) 
