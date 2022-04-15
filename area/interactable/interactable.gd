extends Area2D


var player_is_within_range: bool = false


func _physics_process(_delta):
	player_is_within_range = false
	
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			player_is_within_range = true
	
	$Prompt.visible = player_is_within_range


func _unhandled_input(event):
	if event.is_action_pressed("interact") and player_is_within_range:
		interact()


func interact():
	pass
