extends PlayerState

func enter(msg := {}):
	player.process_mode = Node.PROCESS_MODE_DISABLED
