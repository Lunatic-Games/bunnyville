extends Node


enum AREA {
	TOWN,
	HOUSE_1
}

onready var AREA_SCENES = {
	AREA.TOWN: load("res://area/areas/town.tscn"),
	AREA.HOUSE_1: load("res://area/areas/houses/house_1.tscn")
}


func change_area(to: int, exit: String = ""):
	assert(get_tree().current_scene.name == "Game")

	var game: Node2D = get_tree().current_scene
	game.change_area(to, exit)
