extends PlayerState

const AIR_CONTROL = 150.0
const AUGMENTED_GRAVITY = 3000.0

func physics_update(delta: float) -> void:
	if player.velocity.y > 0:
		player.animation.play("Fall")
		
	if player.is_on_floor():
		if player.get_direction_strenght() == 0.0:
			state_machine.transition_to("Idle")
		else: 
			state_machine.transition_to("Run")
	elif player.velocity.y < 0.0:
		player.velocity.y += AUGMENTED_GRAVITY * delta
	else:
		player.apply_gravity(delta)
		
	player.velocity.x = lerp(player.velocity.x, player.get_direction_strenght() * AIR_CONTROL, 0.3)

func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
		
	if event.is_action_pressed("dash"):
		state_machine.transition_to("Dash")
