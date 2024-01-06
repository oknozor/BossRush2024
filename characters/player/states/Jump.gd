extends PlayerState

const JUMP_SPEED = -800.0
const MAX_AIR_SPEED = -600
const PEEK_AIR_SPEED = -400
const JUMP_GRAVITY = 500
const AIR_CONTROL = 300.0

func physics_update(delta: float) -> void:
	if player.velocity.y < MAX_AIR_SPEED: 
		state_machine.transition_to("Air")
		
	if player.velocity.y < PEEK_AIR_SPEED: 
		player.velocity.y += JUMP_GRAVITY * delta
	else: 
		player.apply_gravity(delta)
			
	player.velocity.y = lerp(player.velocity.y, JUMP_SPEED, 0.3)
	player.velocity.x = lerp(player.velocity.x, player.get_direction_strenght() * AIR_CONTROL, 0.3)

func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
		
	if Input.is_action_just_released("jump"):
		state_machine.transition_to("Air")

	if event.is_action_pressed("dash"):
		state_machine.transition_to("Dash")
