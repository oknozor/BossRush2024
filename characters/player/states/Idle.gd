extends PlayerState

func enter(msg := {}):
	player.velocity = Vector2.ZERO
	player.animation.stop()
	player.animation.play("idle")
	
func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
		
	if player.get_direction_strenght() != 0.0: 
		state_machine.transition_to("Run")
	if event.is_action_pressed("jump"): 
		state_machine.transition_to("Jump")
	if event.is_action_pressed("dash"):
		state_machine.transition_to("Dash")

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		player.apply_gravity(delta)
