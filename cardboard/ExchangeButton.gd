extends Sprite2D

const MIN_SCALE = 2.75
const MAX_SCALE = 3.15
var current_scale = MIN_SCALE
var hovered = false

signal exchange

func _process(_delta):
	if hovered:
		current_scale = lerp(MAX_SCALE, 2.0, 0.04)
	else: 
		current_scale = lerp(MIN_SCALE, 0.0, 0.04)

	set_scale(Vector2(current_scale, current_scale))
	
func _on_area_2d_mouse_entered():
	hovered = true

func _on_area_2d_mouse_exited():
	hovered = false

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("cardboard_click"):
		emit_signal("exchange")
