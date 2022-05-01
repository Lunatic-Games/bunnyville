extends "res://interactable/interactable.gd"


export (String, "TOWN",
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
"BUNSPROUT_HOME",
"BUNSY_HOME") var inside


func interact():
	AreaManager.change_area(inside)
