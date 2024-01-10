extends Boss1State

var speed = 200
	
func enter(_msg := {}):
	jump_to_player()
	
func physics_update(delta: float) -> void:
	if boss.is_on_floor():
		state_machine.transition_to("ChooseNextAttack")


func jump_to_player():
	var player_position = boss.get_player_position()
	var direction = (player_position - boss.global_position).normalized()
	var time_to_reach = boss.global_position.distance_to(player_position) / (speed * 4)
	boss.velocity.x = direction.x * speed
	boss.velocity.y = -2 * Boss1.GRAVITY * time_to_reach
	
func exit() -> void:
	boss.velocity = Vector2.ZERO
