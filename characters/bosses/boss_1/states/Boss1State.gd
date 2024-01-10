class_name Boss1State
extends State

var boss: Boss1

func _ready() -> void:
	await owner.ready
	boss = owner as Boss1
	assert(boss != null)
