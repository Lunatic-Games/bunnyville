extends "res://ui/dialogue/dialogue.gd"


onready var item_texture = $ItemPanel/ItemTexture


func display(text_pages: Array, animate_text: bool = true, portrait: Texture = null) -> void:
	item_texture.texture = portrait
	.display(text_pages, animate_text)
