extends TextureRect


signal finished

var pages: Array = []
var page_i: int = 0


func display(text_pages: Array) -> void:
	if text_pages.size() == 0:  # As to not crash when NPC doesn't have dialogue
		_end_reached()
		return
	
	pages = text_pages
	page_i = 0
	
	$Label.text = pages[page_i]
	show()


func _unhandled_input(event) -> void:
	if not visible:
		return
	
	if event.is_action_pressed("interact"):
		next_page()
		get_tree().set_input_as_handled()


func next_page() -> void:
	if page_i == pages.size() - 1:
		_end_reached()
		return
	
	page_i += 1
	$Label.text = pages[page_i]


func _end_reached() -> void:
	emit_signal("finished")
	hide()
