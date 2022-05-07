extends VBoxContainer


onready var fullscreen_button: Button = $FullscreenButton
onready var exit_fullscreen_button: Button = $ExitFullscreenButton
onready var music_slider: HSlider = $MusicContainer/MusicSlider
onready var sfx_slider: HSlider = $SFXContainer/SFXSlider
onready var music_bus: int = AudioServer.get_bus_index("Music")
onready var sfx_bus: int = AudioServer.get_bus_index("SFX")


func _ready():
	var _ret = get_viewport().connect("size_changed", self, "show_correct_fullscreen_button")


func _unhandled_input(event):
	if visible and event.is_action_pressed("ui_cancel"):
		get_tree().set_input_as_handled()
		hide()


# Update UI on becoming visible
func _on_visibility_changed() -> void:
	if not visible:
		return
	
	show_correct_fullscreen_button()
	
	music_slider.value = db2linear(AudioServer.get_bus_volume_db(music_bus)) * 100.0
	sfx_slider.value = db2linear(AudioServer.get_bus_volume_db(sfx_bus)) * 100.0


func show_correct_fullscreen_button():
	fullscreen_button.visible = not OS.window_fullscreen
	exit_fullscreen_button.visible = OS.window_fullscreen


func _on_FullscreenButton_pressed():
	OS.window_fullscreen = true
	show_correct_fullscreen_button()


func _on_ExitFullscreenButton_pressed():
	OS.window_fullscreen = false
	show_correct_fullscreen_button()


func _on_MusicSlider_value_changed(value):
	var volume = linear2db(value / 100.0)
	AudioServer.set_bus_volume_db(music_bus, volume)


func _on_SFXSlider_value_changed(value):
	var volume = linear2db(value / 100.0)
	AudioServer.set_bus_volume_db(sfx_bus, volume)


func _on_BackButton_pressed():
	hide()
