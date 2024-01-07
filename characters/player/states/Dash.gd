extends PlayerState

const DASH_SPEED = 600
var start_position

func enter(msg := {}):
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
	if player.global_position.distance_to(start_position) > 130 or player.is_on_wall():
		state_machine.transition_to("Idle")
	
func exit() -> void:
	player.sprite.rotation = 0
	
func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return
