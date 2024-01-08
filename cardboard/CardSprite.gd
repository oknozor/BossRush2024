extends Sprite2D
class_name Card

enum CardType { Attack, Defense, Ability }

@export var card_type: CardType
@onready var particles: CPUParticles2D = $CPUParticles2D

const MIN_SCALE = 1.0
const MAX_SCALE = 1.4

var current_scale = MIN_SCALE
var selected = false
var hovered = false

signal card_selected(card: Card)

func _ready():
	match card_type:
		CardType.Attack:
			particles.modulate = Color.from_string("#c52956", Color.RED)
		CardType.Defense:
			particles.modulate = Color.from_string("#4728f6", Color.BLUE)
		CardType.Ability:
			particles.modulate = Color.from_string("#198641", Color.SEA_GREEN)
			
func _process(_delta):
	if hovered:
		current_scale = lerp(MAX_SCALE, 2.0, 0.04)
	else: 
		current_scale = lerp(MIN_SCALE, 0.0, 0.04)

	if selected:
		particles.emitting = true
		modulate = Color(1, 1, 1, 1)
	else:
		particles.emitting = false
		modulate = Color(0.86, 0.86, 0.86, 1)
		
	set_scale(Vector2(current_scale, current_scale))

func _on_area_2d_mouse_entered():
	hovered = true

func _on_area_2d_mouse_exited():
	hovered = false

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("cardboard_click"):
		selected  = !selected
		if selected:
			emit_signal("card_selected", self)

