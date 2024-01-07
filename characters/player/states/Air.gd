extends PlayerState

const AIR_CONTROL = 150.0
const AUGMENTED_GRAVITY = 3000.0

func enter(msg := {}):
	if msg.has("from_ground"):
		player.coyote_timer.start()
		
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
		
	if event.is_action_pressed("jump"):
		if not player.coyote_timer.is_stopped():
			state_machine.transition_to("Jump")
		else:
			player.jump_buffer_timer.start()
			
	if event.is_action_pressed("dash") and player.can_dash():
		state_machine.transition_to("Dash")
