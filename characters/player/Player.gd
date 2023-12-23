class_name Player 
extends CharacterBody2D

const JUMP_VELOCITY = -400.0
const GRAVITY = 1500
var input_paused = false

@onready var gun: Gun = $Gun 

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
		
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta

func set_active_weapon(weapon: Gun.Weapon):
	gun.active_weapon = weapon

