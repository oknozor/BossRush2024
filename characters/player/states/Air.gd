extends PlayerState

const AIR_CONTROL = 300.0
const AUGMENTED_GRAVITY = 3000.0

func physics_update(delta: float) -> void:
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
