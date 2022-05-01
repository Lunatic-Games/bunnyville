extends Node


export (Texture) var portrait
export (String) var title


func display_dialogue(dialogue: Array):
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, 
		dialogue, portrait, title)


func queue_dialogue(dialogue: Array):
	DialogueManager.queue_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, dialogue)
