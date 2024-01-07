extends Area2D

var speed = 7000

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	# queue_free()
	pass
