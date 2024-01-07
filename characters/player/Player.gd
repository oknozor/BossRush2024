class_name Player 
extends CharacterBody2D

const GRAVITY = 1500
var input_paused = false
var previous_horizontal_direction = HorizontalDirection.RIGHT
enum HorizontalDirection { LEFT, RIGHT } 

@onready var gun: Gun = $Gun
@onready var animation: AnimationPlayer = $AnimationPlayer 
@onready var sprite: Sprite2D = $Sprite2D
 
func _process(delta):
	var direction = get_direction()
	match previous_horizontal_direction: 
		HorizontalDirection.LEFT:
			sprite.flip_h = true
		HorizontalDirection.RIGHT:
			sprite.flip_h = false

func _physics_process(delta):
	move_and_slide()

func get_direction_strenght():
	if input_paused:
		return 0.0
		
	var direction = Input.get_axis("left", "right")
	if direction > 0.0: 
		return Input.get_action_strength("right")
	if direction < 0.0: 
		return -Input.get_action_strength("left")
	else: 
		return 0.0

func get_direction():
	var direction = Input.get_axis("left", "right")
	if direction > 0.0: 
		previous_horizontal_direction = HorizontalDirection.RIGHT
	
	if direction < 0.0: 
		previous_horizontal_direction = HorizontalDirection.LEFT
		
	return previous_horizontal_direction
		
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta
