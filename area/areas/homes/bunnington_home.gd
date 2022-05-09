extends GameArea


export (bool) var is_intro = false

onready var kate_bunnginton = $YSort/KateBunnington
onready var bed = $YSort/Objects/Bed
onready var wake_up_position = $YSort/PlayerWakeupPosition
onready var tutorial_text = $TutorialText


func _ready():
	tutorial_text.visible = is_intro
	bed.set_is_player_sleeping(is_intro)
	if is_intro:
		player.set_paused(true)
		player.visible = false


func wake_up_dialogue():
	yield(get_tree().create_timer(2.0), "timeout")
	kate_bunnginton.display_dialogue(["Wakey wakey!"])
	yield(DialogueManager, "finished")
	wake_player()


func wake_player():
	bed.set_is_player_sleeping(false)
	player.set_paused(false)
	player.visible = true
	player.global_position = wake_up_position.global_position
