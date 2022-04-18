extends Node2D


onready var player = $YSort/Player


func place_player_at_exit(exit_name):
	assert($Exits.has_node(exit_name))
	
	player.global_position = $Exits.get_node(exit_name).global_position
