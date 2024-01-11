class_name Health
extends Node

signal healed(health, source_body)
signal damaged(health, source_body)

@onready var invincibility_timer := $InvicibilityTimer
@export var max_health = 3
@export var invicibility_duration = 0.4

var health: int
var status: STATUSES

enum STATUSES {NONE, INVICIBLE}

func _ready() -> void:
	$InvicibilityTimer.wait_time = invicibility_duration
	status = STATUSES.NONE
	health = max_health
	
func take_damage(amount: int, source: Node2D, normal: Vector2):
	if status == STATUSES.INVICIBLE:
		return
	
	var state_machine = get_parent().state_machine
	state_machine.transition_to("Damaged", { source_normal = normal})
	health -= amount	
	if health <= 0:
		state_machine.transition_to("Die")

	
	status = STATUSES.INVICIBLE	
	$InvicibilityTimer.start()

	emit_signal("damaged", health, source)

func heal(amount):
	health += amount
	if health > max_health:
		health = max_health	
	emit_signal("healed", health)

func _on_invicibility_timer_timeout():
	status = STATUSES.NONE

