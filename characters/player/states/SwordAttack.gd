extends PlayerState

func enter(msg := {}):
	player.animation.play("SwordAttack")
	
func physics_update(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x, 0.0, 0.2)
	if !player.animation.is_playing():
		if player.is_on_floor():
			state_machine.transition_to("Idle")
		else: 
			state_machine.transition_to("Air")
