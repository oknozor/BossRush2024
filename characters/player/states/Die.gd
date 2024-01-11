extends PlayerState

func enter(msg := {}):
	player.animation.play("Death")
	player.process_mode = Node.PROCESS_MODE_DISABLED
