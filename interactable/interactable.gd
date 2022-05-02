extends Area2D


var player_is_within_range: bool = false


# Check if player is within range
func _physics_process(_delta: float) -> void:
	player_is_within_range = false
	
	if monitoring:  # Can turn monitoring false if you don't want to check for player
		for body in get_overlapping_bodies():
			if body.is_in_group("player"):
				player_is_within_range = true
	
	$Prompt.visible = player_is_within_range and not DialogueManager.is_open


# Check if interact is pressed and player is within range
func _unhandled_input(event: InputEvent) -> void:
	if DialogueManager.is_open:
		return
	
	if event.is_action_pressed("interact") and player_is_within_range:
		interact()
		get_tree().set_input_as_handled()


# Override
func interact() -> void:
	pass
