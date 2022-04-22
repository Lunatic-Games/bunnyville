extends Area2D


export (String, "TOWN",
"BUNNINGTON_HOME",
"BUNNSWORTH_HOME",
"BUNZ_HOME",
"BUNSELOT_HOME",
"THE_CLEARING",
"THE_DEEP_FOREST",
"THE_TOWER",
"THE_POND",
"THE_GARDENS",
"BUNNATRIX_HOME",
"BUNSPROUT_HOME") var to

export (String) var exit_name


func _on_body_entered(body):
	if body.is_in_group("player"):
		AreaManager.call_deferred("change_area", to, exit_name)
