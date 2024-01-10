extends Boss1State

@onready var timer: Timer = $Timer

func enter(_msg := {}):

	timer.start()
	await timer.timeout
	state_machine.transition_to("ChooseNextAttack")
