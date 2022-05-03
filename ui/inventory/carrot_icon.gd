extends TextureRect


onready var collected_icon: TextureRect = $CollectedIcon


func set_collected(is_collected: bool) -> void:
	collected_icon.visible = is_collected
