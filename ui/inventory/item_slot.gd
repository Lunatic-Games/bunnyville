extends NinePatchRect


onready var icon = $ItemTexture
onready var quantity_label = $QuantityLabel


func set_icon(texture: Texture) -> void:
	icon.texture = texture


func set_quantity(n: int) -> void:
	if n < 2:
		quantity_label.hide()
	else:
		quantity_label.text = str(n)
		quantity_label.show()
