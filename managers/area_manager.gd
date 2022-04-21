extends Node


const AREA_SCENES = {
	"TOWN": preload("res://area/areas/town.tscn"),
	"BUNNINGTON_HOUSE": preload("res://area/areas/houses/bunnington_home.tscn"),
	"BUNNSWORTH_HOUSE": preload("res://area/areas/houses/bunnsworth_home.tscn"),
	"BUNZ_HOUSE": preload("res://area/areas/houses/bunz_home.tscn"),
	"BUNSELOT_HOUSE": preload("res://area/areas/houses/bunselot_home.tscn")
}


func change_area(to: String, exit: String = ""):
	assert(get_tree().current_scene.name == "Game")
	assert(AREA_SCENES.has(to))

	var game: Node2D = get_tree().current_scene
	game.change_area(to, exit)
