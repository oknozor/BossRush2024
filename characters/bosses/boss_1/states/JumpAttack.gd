extends Boss1State

var speed = 200
	
func enter(_msg := {}):
	jump_to_player()
	
func physics_update(delta: float) -> void:
	if boss.is_on_floor():
		state_machine.transition_to("ChooseNextAttack")


func jump_to_player():

	
	var player_position = boss.get_player_position()
	var distance_to_player = boss.global_position.distance_to(player_position)
	var factor = 2 * log(-0.0075 * distance_to_player + 4)
	print(factor)
	var direction = (player_position - boss.global_position).normalized()
	var time_to_reach = boss.global_position.distance_to(player_position) / speed
	boss.velocity.x = direction.x * (speed / factor)
	boss.velocity.y = -(Boss1.GRAVITY / 2) * time_to_reach  * factor
	
func exit() -> void:
	boss.velocity = Vector2.ZERO
