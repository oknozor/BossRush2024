extends Sprite2D

enum ScaleDirection { UP, DOWN }
const MIN_SCALE = 1.0
const MAX_SCALE = 1.2

var scale_direction = ScaleDirection.DOWN

var current_scale = MIN_SCALE

func _process(delta):
	match scale_direction:
		ScaleDirection.DOWN:
			if current_scale > MIN_SCALE:
				current_scale = lerp(current_scale, 0.0, 0.04)
		ScaleDirection.UP:
			if current_scale < MAX_SCALE:
				current_scale = lerp(current_scale, 2.0, 0.04)

	set_scale(Vector2(current_scale, current_scale))

func _on_area_2d_mouse_entered():
	scale_direction = ScaleDirection.UP

func _on_area_2d_mouse_exited():
	scale_direction = ScaleDirection.DOWN
