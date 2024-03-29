extends TextureRect


signal finished

export (bool) var dialogue_sfx = false

const TEXT_ANIMATE_TIME = 0.1
const DIALOGUE_CLIPS = [preload("res://_assets/sfx/talk.wav"),
	preload("res://_assets/sfx/talk_2.wav"),
	preload("res://_assets/sfx/talk_3.wav")]

var pages: Array = []
var page_i: int = 0
var text_animate_timer: float = 0.0
var dialogue_clip_i = 0

onready var label: Label = $Label


func _input(event) -> void:
	if not visible:
		return
	
	if event.is_action_pressed("interact"):
		if label.visible_characters != -1 and label.visible_characters < label.text.length():
			skip_to_end()
		else:
			next_page()
		get_tree().set_input_as_handled()


func _process(delta):
	if label.visible_characters == -1:
		return
	
	text_animate_timer += delta
	while text_animate_timer > TEXT_ANIMATE_TIME:
		text_animate_timer -= delta
		if label.visible_characters < label.text.length():
			label.visible_characters += 1
			if not $SFXPlayer.playing and dialogue_sfx:
				dialogue_clip_i += 1
				if dialogue_clip_i >= DIALOGUE_CLIPS.size():
					dialogue_clip_i = 0
				$SFXPlayer.stream = DIALOGUE_CLIPS[dialogue_clip_i]
				$SFXPlayer.play()


func display(text_pages: Array, animate_text: bool = true) -> void:
	if text_pages.size() == 0:  # As to not crash when NPC doesn't have dialogue
		_end_reached()
		return
	
	pages = text_pages
	page_i = 0
	
	label.text = pages[page_i]
	if animate_text:
		label.visible_characters = 0
	else:
		label.visible_characters = -1
	show()


func next_page() -> void:
	if page_i == pages.size() - 1:
		_end_reached()
		return
	
	page_i += 1
	label.text = pages[page_i]
	if label.visible_characters >= 0:
		label.visible_characters = 0


func skip_to_end() -> void:
	label.visible_characters = label.text.length()


func _end_reached() -> void:
	emit_signal("finished")
	hide()
