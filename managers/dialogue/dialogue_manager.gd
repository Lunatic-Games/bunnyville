extends CanvasLayer


enum DIALOGUE_TYPE {FULL, PORTRAIT, SMALL}

var is_open: bool = false
var queued_dialogue: Array = []


func display_dialogue(type: int, pages: Array, portrait: Texture = null, title: String = "") -> void:
	if is_open:
		queued_dialogue.append([type, pages, portrait, title])
		return
	
	is_open = true
	
	match type:
		DIALOGUE_TYPE.FULL:
			$FullDialogue.display(pages)
			$PortraitDialogue.hide()
			$SmallDialogue.hide()
		DIALOGUE_TYPE.PORTRAIT:
			$PortraitDialogue.display(pages, portrait, title)
			$FullDialogue.hide()
			$SmallDialogue.hide()
		DIALOGUE_TYPE.SMALL:
			$SmallDialogue.display(pages)
			$FullDialogue.hide()
			$PortraitDialogue.hide()


func _on_dialogue_finished() -> void:
	if queued_dialogue:
		var next_dialogue: Array = queued_dialogue.pop_front()
		display_dialogue(next_dialogue[0], next_dialogue[1], next_dialogue[2], next_dialogue[3])
	else:
		is_open = false
