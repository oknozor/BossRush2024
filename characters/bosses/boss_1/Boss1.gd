extends Character
class_name Boss1

const GRAVITY = 1000

@onready var bullet_scene: PackedScene = load("res://hazards/projectile/Bullet.tscn")
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
	var l_bullet = bullet_scene.instantiate()
	var r_bullet = bullet_scene.instantiate()
	var tl_bullet = bullet_scene.instantiate()
	var tr_bullet = bullet_scene.instantiate()
	var t_bullet = bullet_scene.instantiate()
	
	add_child(l_bullet)
	add_child(r_bullet)
	add_child(tl_bullet)
	add_child(tr_bullet)
	add_child(t_bullet)
	l_bullet.direction = Vector2(-1, 0)
	r_bullet.direction = Vector2(1, 0)
	tl_bullet.direction = Vector2(-1, -1)
	tr_bullet.direction = Vector2(1, -1)
	t_bullet.direction = Vector2(0, -1)
	
	r_bullet.global_position = global_position
	l_bullet.global_position = global_position
	tl_bullet.global_position = global_position
	tr_bullet.global_position = global_position
	t_bullet.global_position = global_position
	
	l_bullet.rotation = PI/2
	tl_bullet.rotation = PI/3
	tr_bullet.rotation = -PI/3
	t_bullet.rotation = PI/4
