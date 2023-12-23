extends Sprite2D
class_name Gun

@export var FireBullet : PackedScene
@export var WaterBullet : PackedScene
@export var AirBullet : PackedScene
@export var NormalBullet : PackedScene

@onready var player: Player = get_parent()

enum Weapon {Water, Fire, Air, Normal}
var active_weapon = Weapon.Normal

func _process(delta):
	if player.input_paused:
		return
		
	var angle = Input.get_vector("left_joy_1", "right_joy_1", "up_joy_1", "down_joy_1").angle()
	if angle != 0.0:
		rotation = angle

	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var b
	match active_weapon:
		Weapon.Normal: 
			b = NormalBullet.instantiate()
		Weapon.Fire:
			b = FireBullet.instantiate()
		Weapon.Water:
			b = WaterBullet.instantiate()
		Weapon.Air:
			b = AirBullet.instantiate()
	
	owner.owner.add_child(b)
	b.transform = $Muzzle.global_transform
