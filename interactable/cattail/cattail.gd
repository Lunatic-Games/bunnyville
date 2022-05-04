extends "res://interactable/interactable.gd"



func _ready():
	if ProgressManager.cattails_harvested.has(name):
		queue_free()


func interact():
	if InventoryManager.has_item("SHOVEL"):
		InventoryManager.add_item("CATTAIL")
		ProgressManager.mark_cattail_harvested(name)
		queue_free()
	else:
		DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.SMALL, ["You'll need a shovel to harvest this."], false)


func _on_Collider_body_entered(player: Player):
	if not player:
		return
	
	if player.is_facing_right():
		$Sprite/AnimationPlayer.play("move_right")
	else:
		$Sprite/AnimationPlayer.play("move_left")
