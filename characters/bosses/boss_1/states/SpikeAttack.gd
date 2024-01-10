extends Boss1State

@onready var timer: Timer = $Timer


func enter(_msg := {}):
	boss.spike_attack()
	timer.start()
	await timer.timeout

	state_machine.transition_to("ChooseNextAttack")
