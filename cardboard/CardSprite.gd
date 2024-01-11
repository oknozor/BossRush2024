extends Sprite2D
class_name Card

enum CardType { Attack, Defense, Ability }

@export var card_type: CardType
@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var animation: AnimationPlayer = $AnimationPlayer
var selected = false

signal card_selected(card: Card)
			
func _process(_delta):
	if selected:
		set_particle_color()
		particles.emitting = true
		modulate = Color(1, 1, 1, 1)
	else:
		particles.emitting = false
		modulate = Color(0.86, 0.86, 0.86, 1)
		
func _on_area_2d_mouse_entered():
	animation.play("ScaleUp")

func _on_area_2d_mouse_exited():
	animation.play_backwards("ScaleUp")

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("cardboard_click"):
		selected  = !selected
		if selected:
			emit_signal("card_selected", self)
			
func set_particle_color():
	match card_type:
		CardType.Attack:
			particles.modulate = Color.from_string("#ac3232", Color.RED)
		CardType.Defense:
			particles.modulate = Color.from_string("#5b6ee1", Color.BLUE)
		CardType.Ability:
			particles.modulate = Color.from_string("#37946e", Color.SEA_GREEN)

