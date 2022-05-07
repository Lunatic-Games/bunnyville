extends ColorRect


func _ready():
	if visible:
		get_tree().paused = true


func _input(event):
	if visible and "pressed" in event and event.pressed:
		hide()
		get_tree().paused = false
