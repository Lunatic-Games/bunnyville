extends Node


func restart_game():
	InventoryManager.reset_inventory()
	ProgressManager.reset_progress()
	var _ret = get_tree().change_scene("res://game/game.tscn")
