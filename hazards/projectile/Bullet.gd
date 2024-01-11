extends Area2D
class_name Bullet

var speed = 500
var direction = Vector2(1, 0)
enum CollisionWith { Player, Enemies }

@export var damage_amount = 10
@export var collision_with: CollisionWith = CollisionWith.Player
var source: Node2D

func _ready():
	match collision_with:
		CollisionWith.Player: 
			set_collision_layer_value(8, true)
			set_collision_mask_value(1, true)
		CollisionWith.Enemies:
			set_collision_layer_value(7, true)
			set_collision_mask_value(2, true)
			
func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	var collided_body = body as Character
	if collided_body != null:
		collided_body.health.take_damage(20, owner, self.global_position)
	
	queue_free()
