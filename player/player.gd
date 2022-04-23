extends KinematicBody2D
class_name Player

export (float) var current_speed = 0.0

onready var camera = $Camera2D


func _physics_process(_delta: float) -> void:
	if DialogueManager.is_open:
		return
	
	var input := Vector2()
	if Input.is_action_pressed("move_up"):
		input += Vector2.UP
	if Input.is_action_pressed("move_right"):
		input += Vector2.RIGHT
	if Input.is_action_pressed("move_down"):
		input += Vector2.DOWN
	if Input.is_action_pressed("move_left"):
		input += Vector2.LEFT
	
	if input and not $JumpPlayer.is_playing():
		$JumpPlayer.play("jump")
	
	var move: Vector2 = input.normalized() * current_speed
	
	if move.x:
		$Sprite.scale.x = -sign(move.x) * abs($Sprite.scale.x)
	
	var _result: Vector2 = move_and_slide(move)


func set_facing_direction(right_facing: bool = true):
	if right_facing:
		$Sprite.scale.x = -abs($Sprite.scale.x)
	else:
		$Sprite.scale.x = abs($Sprite.scale.x)


func is_facing_right() -> bool:
	return sign($Sprite.scale.x) < 0.0
