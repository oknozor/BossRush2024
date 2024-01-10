extends Sprite2D
class_name Gun

@export var bullet_: PackedScene
@onready var player: Player = get_parent()

var current_direction = Vector2(1, 0)

func get_current_direction(): 
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction.y = -1
	if Input.is_action_pressed("down"):
		direction.y = 1
	if Input.is_action_pressed("left"):
		direction.x = -1
	if Input.is_action_pressed("right"):
		direction.x = 1
		
	if direction != Vector2.ZERO:
		current_direction = direction
		
func _process(delta):
	if player.input_paused:
		return
		
	get_current_direction()
	if Input.is_action_just_pressed("shoot"):
		shoot(current_direction)

func shoot(direction: Vector2):
	var bullet: Bullet = bullet_.instantiate()
	bullet.direction = direction
	bullet.collision_with = Bullet.CollisionWith.Enemies
	owner.owner.add_child(bullet)
	bullet.transform = $Muzzle.global_transform
	
