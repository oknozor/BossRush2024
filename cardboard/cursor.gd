extends Node2D

@onready var exchange_button: Sprite2D = $ExchangeButton
@onready var pairs = [$AttackPair/CardPair, $DefensePair/CardPair, $AbilityPair/CardPair]

var selected_pair: CardPair

func _ready():
	for pair: CardPair in pairs:
		pair.pair_selected.connect(_on_pair_selected)
	
	exchange_button.exchange.connect(_on_exchange_clicked)

func _on_pair_selected(pair: CardPair):
	selected_pair = pair
	for other: CardPair in pairs:
		if other != selected_pair:
			other.deselect()
			
	$ExchangeButton/CPUParticles2D.emitting = true
	$ExchangeButton/CPUParticles2D.modulate = pair.get_highlight_color()

func _on_exchange_clicked():
	selected_pair.exchange()

