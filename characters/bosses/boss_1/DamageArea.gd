extends Area2D

func _on_body_entered(body: Node2D):
	if body is Player:
		var player = body as Player
		var boss = get_parent()
		player.health.take_damage(20, boss, boss.position)
