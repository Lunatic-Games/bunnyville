extends Area2D


export (AreaManager.AREA) var to
export (String) var exit_name


func _on_body_entered(body):
	if body.is_in_group("player"):
		AreaManager.call_deferred("change_area", to, exit_name)
