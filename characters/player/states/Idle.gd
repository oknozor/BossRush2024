extends PlayerState

func enter(msg := {}):
	player.velocity = Vector2.ZERO
	player.animation.stop()
	player.animation.play("Idle")
	
func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
		
	if player.get_direction_strenght() != 0.0: 
		state_machine.transition_to("Run")
	if event.is_action_pressed("jump"): 
		state_machine.transition_to("Jump")
	if event.is_action_pressed("crouch"): 
		state_machine.transition_to("Crouch")
	if event.is_action_pressed("dash"):
		state_machine.transition_to("Dash")
	if event.is_action_pressed("sword_attack"):
		state_machine.transition_to("SwordAttack")

func physics_update(delta: float) -> void:
	if not player.jump_buffer_timer.is_stopped():
		state_machine.transition_to("Jump")
		
	if not player.is_on_floor():
		state_machine.transition_to("Air")
