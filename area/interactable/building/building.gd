extends "res://area/interactable/interactable.gd"


export (String, "TOWN",
	"BUNNINGTON_HOUSE",
	"BUNNSWORTH_HOUSE",
	"BUNZ_HOUSE",
	"BUNSELOT_HOUSE") var inside


func interact():
	AreaManager.change_area(inside)
