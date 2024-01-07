extends PlayerState

var max_speed = 200.0
var max_acceleration = 0.4

func enter(_msg := {}):
	player.animation.play("Run")
	
func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
	
	if event.is_action_pressed("jump"): 
		state_machine.transition_to("Jump")
		
	if player.get_direction_strenght() == 0.0:
		state_machine.transition_to("Idle")

	if event.is_action_pressed("dash") and player.can_dash():
		state_machine.transition_to("Dash")

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air", { from_ground = true })
	else:
		if not player.jump_buffer_timer.is_stopped():
			state_machine.transition_to("Jump")
		
	player.velocity.x = player.get_direction_strenght() * max_speed
