class_name Health
extends Node

signal health_changed(health, source_body)

@onready var invincibility_timer := $InvicibilityTimer
@export var max_health = 3
@export var invicibility_duration = 0.1

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
	get_parent().fsm.transition_to("Damaged", { source_normal = normal})
	health -= amount	
	if health < 0:
		get_parent().fsm.transition_to("Die")

	
	status = STATUSES.INVICIBLE	
	$InvicibilityTimer.start()

	emit_signal("health_changed", health, source)

func heal(amount):
	health += amount
	if health > max_health:
		health = max_health	
	emit_signal("health_changed", health)

func _on_invicibility_timer_timeout():
	status = STATUSES.NONE


func _on_invincibility_tyimer_timeout():
	pass # Replace with function body.
