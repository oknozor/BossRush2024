extends PlayerState

var enemi_position: Vector2
const KNOCK_BACK_FORCE = 300

func enter(msg := {}):
	player.animation.play("Damaged")
	player.hitbox.set_deferred("monitorable", false)
	enemi_position = msg.get("source_normal")
	Input.start_joy_vibration(0, 0.5, 0.6, 0.3)

func physics_update(delta):
	var normal = (player.position - enemi_position).normalized()
	player.velocity.x = normal.x * KNOCK_BACK_FORCE
	player.velocity.y = normal.y * KNOCK_BACK_FORCE
	
	if !player.animation.is_playing():
		if player.is_on_floor():
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Air")

func exit(msg := {}):
	player.hitbox.set_deferred("monitorable", true)
	Input.stop_joy_vibration(0)

