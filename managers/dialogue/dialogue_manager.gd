extends CanvasLayer


signal open_toggled(is_open)

enum DIALOGUE_TYPE {FULL, PORTRAIT, SMALL}

var is_open: bool = false
var queued_dialogue: Array = []


func display_dialogue(type: int, pages: Array, animate_text: bool = true, portrait: Texture = null, title: String = "", force_show: bool = false) -> void:
	if is_open and not force_show:
		queued_dialogue.append([type, pages, animate_text, portrait, title])
		return
	
	if not is_open:
		emit_signal("open_toggled", true)
	is_open = true
	
	match type:
		DIALOGUE_TYPE.FULL:
			$FullDialogue.display(pages, animate_text)
			$PortraitDialogue.hide()
			$SmallDialogue.hide()
		DIALOGUE_TYPE.PORTRAIT:
			$PortraitDialogue.display(pages, animate_text, portrait, title)
			$FullDialogue.hide()
			$SmallDialogue.hide()
		DIALOGUE_TYPE.SMALL:
			$SmallDialogue.display(pages, animate_text)
			$FullDialogue.hide()
			$PortraitDialogue.hide()


func _on_dialogue_finished() -> void:
	if queued_dialogue:
		var next_dialogue: Array = queued_dialogue.pop_front()
		display_dialogue(next_dialogue[0], next_dialogue[1], next_dialogue[2], next_dialogue[3], next_dialogue[4], true)
	else:
		is_open = false
		emit_signal("open_toggled", false)
