extends "res://area/interactable/interactable.gd"



func interact():
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, ["You'll need a shovel to harvest this."])


func _on_Collider_body_entered(player: Player):
	if not player:
		return
	
	if player.is_facing_right():
		$Sprite/AnimationPlayer.play("move_right")
	else:
		$Sprite/AnimationPlayer.play("move_left")
