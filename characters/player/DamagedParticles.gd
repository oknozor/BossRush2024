extends Node2D

@onready var left_particles: CPUParticles2D = $Left
@onready var right_particles: CPUParticles2D = $Right

func emit() -> void: 
	left_particles.emitting = true
	right_particles.emitting = true


func _on_health_damaged(health, source_body):
	emit()
