extends ProgressBar
class_name HealthBar

@export var bar_color: Color

@onready var timer = $Timer
@onready var damage_bar = $DamageBar

var health = 0:
	set(new_health):
		var prev_health = health
		health = min(max_value, new_health)
		value = health
	
		if health <= 0: 
			health = 0
		if health < prev_health: 
			timer.start()
		else:
			damage_bar.value = health

func _ready():
	self_modulate = bar_color

		
func init_health(_health):
	health = _health
	max_value = _health
	value = _health
	damage_bar.max_value = _health
	damage_bar.value = _health
	
	
func _on_timer_timeout():
	damage_bar.value = health

func _on_health_damaged(new_health, source_body):
	health = new_health
