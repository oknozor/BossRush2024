extends PlayerState

const JUMP_SPEED = -700.0
const MAX_AIR_SPEED = -530
const PEEK_AIR_SPEED = -280
const JUMP_GRAVITY = 600
const AIR_CONTROL = 150.0

func enter(_msg := {}) -> void:
	player.velocity.y = -50
	player.animation.play("Jump")
	
func physics_update(delta: float) -> void:
	if player.velocity.y < MAX_AIR_SPEED or player.is_on_ceiling(): 
		state_machine.transition_to("Air")
		
	if player.velocity.y < PEEK_AIR_SPEED:
		player.velocity.y = lerp(player.velocity.y, JUMP_SPEED, 0.3)
		player.velocity.y += JUMP_GRAVITY * delta
	else:
		player.velocity.y = lerp(player.velocity.y, JUMP_SPEED, 0.15)
		player.apply_gravity(delta)
			

	player.velocity.x = lerp(player.velocity.x, player.get_direction_strenght() * AIR_CONTROL, 0.2)

func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
		
	if Input.is_action_just_released("jump"):
		state_machine.transition_to("Air")

	if event.is_action_pressed("dash"):
		state_machine.transition_to("Dash")
