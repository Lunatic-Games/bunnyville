extends Node2D

onready var current_area = $Town
onready var transition_player = $CanvasLayer/Transition/AnimationPlayer


func change_area(new_area: String, player_exit: String = "") -> void:
	assert(ResourceLoader.exists(new_area))
	
	get_tree().paused = true
	transition_player.play("fade_in")
	yield(transition_player, "animation_finished")
	
	var area_instance = ResourceLoader.load(new_area).instance()
	current_area.queue_free()
	add_child(area_instance)
	move_child(area_instance, 0)
	current_area = area_instance

	if player_exit:
		current_area.place_player_at_exit(player_exit)
	
	transition_player.play("fade_out")
	yield(transition_player, "animation_finished")
	get_tree().paused = false
