extends Sprite2D
class_name Gun

@export var Bullet : PackedScene
@onready var player: Player = get_parent()

func _process(delta):
	if player.input_paused:
		return
		
	var angle = Input.get_vector("left_joy_1", "right_joy_1", "up_joy_1", "down_joy_1").angle()
	if angle != 0.0:
		rotation = angle

	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = Bullet.instantiate()
	owner.owner.add_child(bullet)
	bullet.transform = $Muzzle.global_transform
