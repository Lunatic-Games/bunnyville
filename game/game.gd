extends Node2D


onready var area = $Town
onready var transition_player = $Overlay/Transition/AnimationPlayer


func change_area(new_area: int, player_exit: String = "") -> void:
	# Transition to black
	get_tree().paused = true
	transition_player.play("fade_in")
	yield(transition_player, "animation_finished")
	
	# Swap area
	var area_instance: Node2D = AreaManager.AREA_SCENES[new_area].instance()
	area.queue_free()
	add_child(area_instance)
	move_child(area_instance, 0)
	area = area_instance

	# Check if player should be placed at a specific exit, instead of default position
	if player_exit:
		area.place_player_at_exit(player_exit)
	
	# Force camera update, otherwise it waits till unpause (might just be Godot 3.3)
	area.player.camera.make_current()
	
	# Transition back
	transition_player.play("fade_out")
	yield(transition_player, "animation_finished")
	get_tree().paused = false
