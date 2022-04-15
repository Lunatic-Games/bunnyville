extends "res://tileset/interactable/interactable.gd"


export (PackedScene) var inside


func interact():
	get_tree().change_scene_to(inside)
