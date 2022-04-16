extends "res://area/interactable/interactable.gd"


export (String, MULTILINE) var text


func interact() -> void:
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, [text])
