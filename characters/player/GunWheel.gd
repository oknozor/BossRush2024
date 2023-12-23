extends Control

@onready var cursor: Area2D = $Cursor
@onready var player: Player = get_parent()

func _process(delta):
	if Input.is_action_just_pressed("wheel_menu"):
		if visible: 
			close_menu()
		else:
			open_menu()
			
	if visible:
		var angle = Input.get_vector("left_joy_1", "right_joy_1", "up_joy_1", "down_joy_1").angle()
		if angle != 0.0:
			cursor.rotation = angle
			
		if Input.is_action_just_pressed("wheel_menu_accept"): 
			for weapon in cursor.get_overlapping_areas():
				match weapon.get_parent().name: 
					"Base":
						player.set_active_weapon(Gun.Weapon.Normal)
					"Fire":
						player.set_active_weapon(Gun.Weapon.Fire)
					"Water":
						player.set_active_weapon(Gun.Weapon.Water)
					"Air":
						player.set_active_weapon(Gun.Weapon.Air)
				close_menu()
				return
				
func close_menu():
	Engine.time_scale = 1
	visible = false
	player.input_paused = false
	
func open_menu():
	Engine.time_scale = 0.03
	visible = true
	player.input_paused = true
