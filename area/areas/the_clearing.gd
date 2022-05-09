extends "res://area/area.gd"


onready var outro_player: AnimationPlayer = $OutroPlayer
onready var ghost_portrait: Texture = preload("res://_assets/art/npcs/bunnington_ghost.png")


# Called by OutroPlayer
func outro_done():
	Utility.restart_game()


func _on_Statue_carrots_placed():
	player.set_paused(true)
	outro_player.play("carrots_placed")
	yield(outro_player, "animation_finished")
	display_ghost_dialogue(["Blah blah blah"])
	yield(DialogueManager, "finished")
	outro_player.play("outro")


func display_ghost_dialogue(dialogue: Array):
	DialogueManager.display_dialogue(DialogueManager.DIALOGUE_TYPE.PORTRAIT, 
		dialogue, true, ghost_portrait, "Mr. Bunnington")
