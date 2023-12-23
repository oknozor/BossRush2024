extends PlayerState

var max_speed = 350.0
var max_acceleration = 0.4

func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
	
	if event.is_action_pressed("jump"): 
		state_machine.transition_to("Jump")

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		player.apply_gravity(delta)
	
	player.velocity.x = player.get_direction_strenght() * max_speed
