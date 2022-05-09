extends Node


signal progressed(progression)


const PROGRESSIONS: Array = [
	"FLOUR_GIVEN_TO_MRS_BUNNSWORTH",
	"BLUEPRINTS_GIVEN_TO_DREW_BUNZ",
	"SWORD_GIVEN_TO_SIR_BUNSELOT",
	"HAMMER_GIVEN_TO_JOHN_BUNZ",
	"RABUNZEL_DOWN_FROM_TOWER",
	"FLOWER_PLANTED",
	"WORMS_GIVEN_TO_BUNSY",
	"MONOCLE_GIVEN_TO_MR_BUNNSWORTH",
	"CATTAILS_GIVEN_TO_BUNNATRIX",
	"COOKIES_GIVEN_TO_KATE",
	"CARROT_RECEIVED_FROM_RABUNZEL"
]

var achieved: Array = []
var chests_opened: Array = []
var flowers_planted: Array = []
var cattails_harvested: Array = []


func progression_achieved(progression: String) -> void:
	assert(PROGRESSIONS.has(progression))
	achieved.append(progression)
	emit_signal("progressed", progression)


func has_progression(progression: String) -> bool:
	assert(PROGRESSIONS.has(progression))
	return achieved.has(progression)


func mark_chest_opened(chest_name: String) -> void:
	chests_opened.append(chest_name)


func mark_flower_planted(pot_name: String) -> void:
	flowers_planted.append(pot_name)


func mark_cattail_harvested(cattail_name: String) -> void:
	cattails_harvested.append(cattail_name)


func count_progressions(progression: String) -> int:
	assert(PROGRESSIONS.has(progression))
	return achieved.count(progression)


func reset_progress() -> void:
	achieved = []
	chests_opened = []
	flowers_planted = []
	cattails_harvested = []
