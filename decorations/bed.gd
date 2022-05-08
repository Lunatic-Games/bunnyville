extends StaticBody2D


export (bool) var is_player_sleeping = false setget set_is_player_sleeping

onready var normal_sprite = $NormalSprite
onready var sleeping_sprite = $SleepingSprite
onready var particles = $Particles2D


func _ready():
	set_is_player_sleeping(is_player_sleeping)


func set_is_player_sleeping(is_sleeping):
	is_player_sleeping = is_sleeping
	if normal_sprite:
		$NormalSprite.visible = not is_player_sleeping
	if sleeping_sprite:
		$SleepingSprite.visible = is_player_sleeping
	if particles:
		$Particles2D.emitting = is_player_sleeping
