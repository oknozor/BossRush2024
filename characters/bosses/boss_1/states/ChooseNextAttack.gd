extends Boss1State

@onready var timer: Timer = $Timer

var attacks = ["JumpAttack", "SpikeAttack", "ChargeAttack"]
var previous_attack: int
var previous_attack_count: int

func enter(_msg := {}):
	boss.animation.play("ChooseNextAttack")
	var wait_time = randf_range(0.7, 1)
	timer.start(wait_time)

func _on_timer_timeout():
	var next_attack_idx = randi_range(0, 1);
	if next_attack_idx == previous_attack:
		previous_attack_count += 1
	else:
		previous_attack_count = 1

	if previous_attack_count > 2:
		next_attack_idx += 1
	
	if next_attack_idx > attacks.size() - 1:
		next_attack_idx = 0

	var next_attack = attacks[next_attack_idx]
		
	previous_attack = next_attack_idx
	state_machine.transition_to(next_attack)
