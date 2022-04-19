extends "res://area/interactable/interactable.gd"


export (String) var item_contained
export (bool) var locked = false
export (String) var item_requirement


func interact():
	if locked:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, ["It is locked..."])
	else:
		open()


func open():
	$Closed.visible = false
	$Opened.visible = true
