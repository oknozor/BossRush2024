extends Node

var cursor = load("res://cardboard/assets/mouse.png")

# TODO
func _ready():
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, Vector2(0, 0))
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_IBEAM, Vector2(0, 0))

