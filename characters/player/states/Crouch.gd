extends PlayerState

func enter(msg := {}):
	player.velocity = Vector2.ZERO
	player.animation.stop()
	player.animation.play("CrouchIdle")
	
func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
		
	if event.is_action_released("crouch"):
		state_machine.transition_to("Idle")

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
