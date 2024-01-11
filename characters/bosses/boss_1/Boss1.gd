extends Character
class_name Boss1

const GRAVITY = 1000

@onready var bullet_scene: PackedScene = load("res://hazards/projectile/Bullet.tscn")
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var muzzle_left = $MuzzleL
@onready var muzzle_top_left = $MuzzleTL
@onready var muzzle_top = $MuzzleT
@onready var muzzle_top_right = $MuzzleTR
@onready var muzzle_right = $MuzzleR

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	move_and_slide()

func get_player_position():
	var player: Player = get_parent().get_node("Player")
	return player.global_position
	
func spike_attack():
	generate_projectile(Vector2(-1, 0), PI/2)
	generate_projectile(Vector2(1, 0), 0)
	generate_projectile(Vector2(-1, -1), PI/3)
	generate_projectile(Vector2(1, -1), -PI/3)
	generate_projectile(Vector2(0, -1), PI/4)
	
func generate_projectile(direction: Vector2, rotation: float): 
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.direction = direction
	bullet.global_position = global_position
	bullet.rotation = rotation
	bullet.source = self
	
