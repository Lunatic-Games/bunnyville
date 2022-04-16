extends "res://area/interactable/interactable.gd"


export (Array, String, MULTILINE) var dialogue = []


func interact() -> void:
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, dialogue)
