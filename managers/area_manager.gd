extends Node


const AREA_SCENES = {
	AreaList.AREAS.TOWN: preload("res://area/areas/town.tscn"),
	AreaList.AREAS.HOUSE_1: preload("res://area/areas/houses/house_1.tscn")
}


func change_area(to: int, exit: String = ""):
	assert(get_tree().current_scene.name == "Game")

	var game: Node2D = get_tree().current_scene
	game.change_area(to, exit)
