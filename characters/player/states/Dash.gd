extends PlayerState

const DASH_SPEED = 600

@onready var timer = $Timer

func enter(msg := {}):
	timer.start()
	player.animation.stop()
	player.animation.play("idle")

	player.velocity.y = 0
	match player.get_direction(): 
		Player.HorizontalDirection.LEFT:
			player.sprite.rotation = -(PI / 2)
			player.velocity.x = -DASH_SPEED
		Player.HorizontalDirection.RIGHT:
			player.sprite.rotation = PI / 2
			player.velocity.x = DASH_SPEED

func exit() -> void:
	player.sprite.rotation = 0
	
func handle_input(event: InputEvent) -> void:
	if player.input_paused:
		return

func _on_timer_timeout():
	state_machine.transition_to("Idle")
