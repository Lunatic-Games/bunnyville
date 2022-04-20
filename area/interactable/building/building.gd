extends "res://area/interactable/interactable.gd"


export (AreaManager.AREA) var inside


func interact():
	AreaManager.change_area(inside)
