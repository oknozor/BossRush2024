extends PlayerState

var enemi_position: Vector2
const KNOCK_BACK_FORCE = 400

func enter(msg := {}):
	player.animation.play("Damaged")
	enemi_position = msg.get("source_normal")
	Input.start_joy_vibration(0, 0.5, 0.6, 0.3)

func physics_update(delta):
	var normal = (player.position - enemi_position).normalized()
	player.velocity.x = normal.x * KNOCK_BACK_FORCE
	player.velocity.y = normal.y * KNOCK_BACK_FORCE
	
	if (player.position.distance_to(enemi_position)) > 80: 
		if not player.is_on_floor(): 
			state_machine.transition_to("Air")
			return 
		
		if player.is_on_floor() and player.get_direction() != 0:
			state_machine.transition_to("Run")
		else: 
			state_machine.transition_to("Idle")

func exit(msg := {}):
	Input.stop_joy_vibration(0)

