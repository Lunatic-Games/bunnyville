extends NinePatchRect

class_name ItemSlot

onready var popup = $Popup
onready var popup_label = $Popup/Container/MarginContainer/Label
onready var icon = $ItemTexture
onready var quantity_label = $QuantityLabel


func set_popup_text(text: String) -> void:
	popup_label.text = text
	if not text:
		popup.hide()


func set_icon(texture: Texture) -> void:
	icon.texture = texture


func set_quantity(n: int) -> void:
	if n < 2:
		quantity_label.hide()
	else:
		quantity_label.text = str(n)
		quantity_label.show()


func _on_mouse_entered():
	if popup_label.text:
		popup.show()
	else:
		popup.hide()


func _on_mouse_exited():
	popup.hide()
