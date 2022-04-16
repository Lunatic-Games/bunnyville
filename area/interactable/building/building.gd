extends "res://area/interactable/interactable.gd"


export (String, FILE) var inside


func interact():
	var _ret = get_tree().change_scene(inside)
