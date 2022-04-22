extends Node


# For copy-and-pasting
"""
"TOWN",
"BUNNINGTON_HOME",
"BUNNSWORTH_HOME",
"BUNZ_HOME",
"BUNSELOT_HOME",
"THE_CLEARING",
"THE_DEEP_FOREST",
"THE_TOWER",
"THE_POND",
"THE_GARDENS",
"BUNNATRIX_HOME",
"BUNSPROUT_HOME"
"""

const AREA_SCENES = {
	"TOWN": preload("res://area/areas/town.tscn"),
	"BUNNINGTON_HOME": preload("res://area/areas/homes/bunnington_home.tscn"),
	"BUNNSWORTH_HOME": preload("res://area/areas/homes/bunnsworth_home.tscn"),
	"BUNZ_HOME": preload("res://area/areas/homes/bunz_home.tscn"),
	"BUNSELOT_HOME": preload("res://area/areas/homes/bunselot_home.tscn"),
	"THE_CLEARING": preload("res://area/areas/the_clearing.tscn"),
	"THE_DEEP_FOREST": preload("res://area/areas/the_deep_forest.tscn"),
	"THE_TOWER": preload("res://area/areas/the_tower.tscn"),
	"THE_POND": preload("res://area/areas/the_pond.tscn"),
	"THE_GARDENS": preload("res://area/areas/the_gardens.tscn"),
	"BUNNATRIX_HOME": preload("res://area/areas/homes/bunnatrix_home.tscn"),
	"BUNSPROUT_HOME": preload("res://area/areas/homes/bunsprout_home.tscn")
}


func change_area(to: String, exit: String = ""):
	assert(get_tree().current_scene.name == "Game")
	assert(AREA_SCENES.has(to))

	var game: Node2D = get_tree().current_scene
	game.change_area(to, exit)
