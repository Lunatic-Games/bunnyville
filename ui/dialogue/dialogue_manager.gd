extends CanvasLayer


enum DIALOGUE_TYPE {FULL, PORTRAIT, SMALL}

var is_open = false

func display_dialogue(type: int, pages: Array) -> void:
	is_open = true
	
	match type:
		DIALOGUE_TYPE.FULL:
			$FullDialogue.display(pages)
			$PortraitDialogue.hide()
			$SmallDialogue.hide()
		DIALOGUE_TYPE.PORTRAIT:
			$PortraitDialogue.display(pages)
			$FullDialogue.hide()
			$SmallDialogue.hide()
		DIALOGUE_TYPE.SMALL:
			$SmallDialogue.display(pages)
			$FullDialogue.hide()
			$PortraitDialogue.hide()


func _on_dialogue_finished() -> void:
	is_open = false
