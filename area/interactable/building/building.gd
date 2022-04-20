extends "res://area/interactable/interactable.gd"


export (AreaList.AREAS) var inside


func interact():
	AreaManager.change_area(inside)
