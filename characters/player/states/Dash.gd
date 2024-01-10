extends PlayerState

const DASH_SPEED = 600
const DASH_DISTANCE = 100
var start_position

func enter(msg := {}):
	if not player.is_on_floor():
		player.air_dash -= 1
		
	start_position = player.global_position
	player.animation.stop()
	player.animation.play("Jump")
	player.velocity.y = 0
	
	match player.get_direction(): 
		Player.HorizontalDirection.LEFT:
			player.sprite.rotation = -(PI / 2)
			player.velocity.x = -DASH_SPEED
		Player.HorizontalDirection.RIGHT:
			player.sprite.rotation = PI / 2
			player.velocity.x = DASH_SPEED

func physics_update(delta: float) -> void:
	if player.global_position.distance_to(start_position) > DASH_DISTANCE or player.is_on_wall():
		if not player.is_on_floor():
			state_machine.transition_to("Air")
		elif player.get_direction_strenght() != 0:
			state_machine.transition_to("Run")
		else:
			state_machine.transition_to("Idle")
	
func exit() -> void:
	player.dash_timer.start()
	player.sprite.rotation = 0
	
func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
