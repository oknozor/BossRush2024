extends Node2D

@onready var player_health_bar: HealthBar = $UI/PlayerHealthBar
@onready var boss_health_bar: HealthBar = $UI/BossHealthBar

@onready var player: Player = $Player
@onready var boss: Character = $Boss

@onready var music: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var bullet_count: RichTextLabel = $UI/RichTextLabel

func _ready():
	player.health.healed.connect(_on_player_health_changed)
	player.health.damaged.connect(_on_player_health_changed)
	
	boss.health.healed.connect(_on_boss_health_changed)
	boss.health.damaged.connect(_on_boss_health_changed)
	
	player_health_bar.init_health(player.health.health)
	boss_health_bar.init_health(boss.health.health)

func _process(delta):
	if !music.playing: 
		music.play()
	
	bullet_count.text = "{count}".format({ "count":player.bullet_count })
	
		
func _on_player_health_changed(health, _source):
	player_health_bar.health = health

func _on_boss_health_changed(health, _source):
	boss_health_bar.health = health
