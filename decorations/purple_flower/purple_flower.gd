extends Area2D


func _on_body_entered(player: Player):
	if not player:
		return
	
	if player.is_facing_right():
		$Sprite/AnimationPlayer.play("move_right")
	else:
		$Sprite/AnimationPlayer.play("move_left")
