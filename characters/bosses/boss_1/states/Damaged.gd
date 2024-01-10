extends Boss1State

func enter(_msg := {}):
	state_machine.transition_to("ChooseNextAttack")
