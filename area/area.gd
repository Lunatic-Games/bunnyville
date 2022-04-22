extends Node2D
class_name GameArea

export (String) var display_name

onready var player: Player = $YSort/Player as Player


func place_player_at_exit(exit_name):
	assert($Exits.has_node(exit_name))
	
	player.global_position = $Exits.get_node(exit_name).global_position
