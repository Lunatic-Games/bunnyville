extends "res://area/interactable/interactable.gd"


export (String, FILE) var inside


func interact():
	AreaManager.change_area(inside)
