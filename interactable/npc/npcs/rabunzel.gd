extends "res://interactable/npc/npc.gd"


export (NodePath) var rope_node_path


func _ready():
	update_state()
	ProgressManager.connect("progressed", self, "update_state")


func interact():
	if ProgressManager.has_progression("RABUNZEL_DOWN_FROM_TOWER") and not ProgressManager.has_progression("CARROT_RECEIVED_FROM_RABUNZEL"):
		display_dialogue(["Thank you for your help getting me down! I want you to have this:"])
		display_item_received(["Rabunzel gives you a carrot"], "CARROT")
		InventoryManager.add_carrot()
		ProgressManager.progression_achieved("CARROT_RECEIVED_FROM_RABUNZEL")
	elif ProgressManager.has_progression("RABUNZEL_DOWN_FROM_TOWER"):
		display_dialogue(["Thank you for your help getting me down!"])
	else:
		display_dialogue(["I don't have any way to get down! I need my knight in shining armor to rescue me!"])


func update_state(_progression = null):
	if DialogueManager.is_open:
		yield(DialogueManager, "open_toggled")
	
	if ProgressManager.has_progression("RABUNZEL_DOWN_FROM_TOWER"):
		$Sprite.visible = true
		$Collider/CollisionShape2D.set_deferred("disabled", false)
		get_node(rope_node_path).visible = true
	else:
		$Sprite.visible = false
		$Collider/CollisionShape2D.set_deferred("disabled", true)
		get_node(rope_node_path).visible = false
