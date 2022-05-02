extends "res://interactable/interactable.gd"


func interact():
	monitoring = false
	$Sprite.hide()
	$SpriteWithFlower.show()
