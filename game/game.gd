extends Node2D


onready var area: GameArea = $BunningtonHome as GameArea
onready var transition_player: AnimationPlayer = $Overlay/Transition/AnimationPlayer
onready var area_name: Label = $Overlay/AreaName
onready var area_name_player: AnimationPlayer = $Overlay/AreaName/AnimationPlayer

onready var pause_menu = $Overlay/PauseMenu
onready var main_menu = $Overlay/MainMenu


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().set_input_as_handled()
		get_tree().paused = true
		pause_menu.show()


func change_area(new_area: String, player_exit: String = "") -> void:
	# Transition to black
	get_tree().paused = true
	transition_player.play("fade_in")
	yield(transition_player, "animation_finished")
	
	var is_player_facing_right = area.player.is_facing_right()  # Keep direction
	
	# Swap area
	var area_instance: GameArea = AreaManager.AREA_SCENES[new_area].instance()
	area.queue_free()
	add_child(area_instance)
	move_child(area_instance, 0)
	area = area_instance

	# Check if player should be placed at a specific exit, instead of default position
	if player_exit:
		area.place_player_at_exit(player_exit)
	area.player.set_facing_direction(is_player_facing_right)
	
	# Force camera update, otherwise it waits till unpause (might just be Godot 3.3)
	area.player.camera.make_current()
	
	# Display area name
	area_name.text = area.display_name
	area_name_player.stop()
	area_name_player.play("fade")
	
	# Transition back
	transition_player.play("fade_out")
	yield(transition_player, "animation_finished")
	get_tree().paused = false


func _on_MainMenu_visibility_changed():
	if not main_menu.visible:
		$BunningtonHome.wake_up_dialogue()
