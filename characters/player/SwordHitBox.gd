extends Area2D

@onready var player = get_parent()

func _on_body_entered(body):
	print(body.name)
	var enemy = body as Character
	if enemy: 
		enemy.health.take_damage(30, player, player.global_position)
