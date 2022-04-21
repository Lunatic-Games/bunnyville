extends Node


signal progressed(progression)


const PROGRESSIONS: Array = [
	"FLOUR_GIVEN_TO_MRS_BUNNSWORTH"
]

var achieved: Array = []


func progression_achieved(progression: String) -> void:
	assert(PROGRESSIONS.has(progression))
	assert(not achieved.has(progression))
	achieved.append(progression)
	emit_signal("progressed", progression)


func has_progression(progression: String) -> bool:
	assert(PROGRESSIONS.has(progression))
	return achieved.has(progression)
