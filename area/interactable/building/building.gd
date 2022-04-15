extends "res://area/interactable/interactable.gd"


export (PackedScene) var inside


func interact():
	var _ret = get_tree().change_scene_to(inside)
