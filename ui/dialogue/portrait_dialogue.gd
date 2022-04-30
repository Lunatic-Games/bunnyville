extends "res://ui/dialogue/dialogue.gd"


func display(text_pages: Array, portrait: Texture = null, title: String = "") -> void:
	$Portrait.texture = portrait
	$Title.text = title
	.display(text_pages)
