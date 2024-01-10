extends Boss1State

@onready var timer: Timer = $Timer

var attacks = ["JumpAttack", "SpikeAttack"]
var previous_attack: int
var previous_attack_count: int

func enter(_msg := {}):
	timer.start(randf_range(1, 1.5))

	
func _on_timer_timeout():
	var next_attack_idx = randi_range(0, 1);
	# increment atatck count on successive same attack
	if next_attack_idx == previous_attack:
		previous_attack_count += 1
	else:
		previous_attack_count = 1

	# change next attack if made more than 2 times in a row
	if previous_attack_count > 2:
		next_attack_idx += 1
	
	# shift
	if next_attack_idx > attacks.size() - 1:
		next_attack_idx = 0

	var next_attack = attacks[next_attack_idx]
		
	previous_attack = next_attack_idx
	state_machine.transition_to(next_attack)
