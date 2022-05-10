extends Node


func _input(event):
	if event.is_action_pressed("fullscreen_toggle"):
		OS.window_fullscreen = not OS.window_fullscreen


func restart_game():
	InventoryManager.reset_inventory()
	ProgressManager.reset_progress()
	DialogueManager.reset()
	var _ret = get_tree().change_scene("res://game/game.tscn")
