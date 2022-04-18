extends Node


func change_area(to: String, exit: String = ""):
	assert(get_tree().current_scene.name == "Game")

	var game: Node2D = get_tree().current_scene
	game.change_area(to, exit)
	
