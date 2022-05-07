extends ColorRect


onready var button_container = $Buttons
onready var settings_menu = $SettingsMenu
onready var quit_confirmation_container = $QuitConfirmation


func _unhandled_input(event):
	if visible and event.is_action_pressed("pause"):
		get_tree().set_input_as_handled()
		quit_confirmation_container.visible = false
		button_container.visible = true
		_on_ContinueButton_pressed()


func _on_ContinueButton_pressed():
	hide()
	get_tree().paused = false


func _on_SettingsButton_pressed():
	button_container.hide()
	settings_menu.show()


func _on_QuitButton_pressed():
	button_container.hide()
	quit_confirmation_container.show()


func _on_SettingsMenu_visibility_changed():
	if not settings_menu.visible:
		button_container.show()


func _on_CancelQuitButton_pressed():
	quit_confirmation_container.hide()
	button_container.show()


func _on_ConfirmQuitButton_pressed():
	get_tree().paused = false
	var _ret = get_tree().change_scene("res://game/game.tscn")
