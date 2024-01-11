extends Boss1State

var speed = 1000
var player_position: Vector2
var init_position: Vector2

func enter(_msg := {}):
	player_position = boss.get_player_position()
	init_position = boss.global_position
	
func physics_update(delta: float) -> void:
	if abs(boss.global_position.x) - abs(player_position.x) < 0:
		state_machine.transition_to("ChooseNextAttack")
		
	var direction = init_position.direction_to(player_position)
	boss.velocity.x = lerp(boss.velocity.x, direction.x * speed, 0.3)
	
