extends Node

var cursor = load("res://cardboard/assets/mouse.png")

const card: PackedScene = preload("res://cardboard/card.tscn")

var attack_player_card: Card
var defense_player_card: Card
var ability_player_card: Card
var attack_boss_card: Card
var defense_boss_card: Card
var ability_boss_card: Card

var defense_color = ""

var cards = []

@onready var exchange_button: Sprite2D = $ExchangeButton

func _process(delta):
	selection_pair(attack_player_card, attack_boss_card)
	selection_pair(defense_player_card, defense_boss_card)
	selection_pair(ability_player_card, ability_boss_card)

func _ready():
	attack_player_card = card.instantiate()
	attack_player_card.card_type = Card.CardType.Attack
	
	defense_player_card = card.instantiate()
	defense_player_card.card_type = Card.CardType.Defense
		
	ability_player_card = card.instantiate()
	ability_player_card.card_type = Card.CardType.Ability
	
	$PlayerHand.add_child(attack_player_card)
	$PlayerHand.add_child(defense_player_card)
	$PlayerHand.add_child(ability_player_card)
	
	attack_player_card.position = $PlayerHand/CardSlot1.position
	defense_player_card.position = $PlayerHand/CardSlot2.position
	ability_player_card.position = $PlayerHand/CardSlot3.position
	
	attack_boss_card = card.instantiate()
	attack_boss_card.card_type = Card.CardType.Attack
	
	defense_boss_card = card.instantiate()
	defense_boss_card.card_type = Card.CardType.Defense

	ability_boss_card = card.instantiate()
	ability_boss_card.card_type = Card.CardType.Ability
		
	$BossHand.add_child(attack_boss_card)
	$BossHand.add_child(defense_boss_card)
	$BossHand.add_child(ability_boss_card)
	
	attack_boss_card.position = $BossHand/CardSlot1.position
	defense_boss_card.position = $BossHand/CardSlot2.position
	ability_boss_card.position = $BossHand/CardSlot3.position
	
	cards.append(attack_player_card)
	cards.append(defense_player_card)
	cards.append(ability_player_card)
	cards.append(attack_boss_card)
	cards.append(defense_boss_card)
	cards.append(ability_boss_card)
	
	for card_: Card in cards:
		card_.card_selected.connect(_on_card_selected)
		
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, Vector2(0, 0))
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_IBEAM, Vector2(0, 0))


func _on_card_selected(selected_card: Card):
	$ExchangeButton/CPUParticles2D.emitting = true
	$ExchangeButton/CPUParticles2D.modulate = selected_card.particles.modulate
	
	for card: Card in cards:
		card.selected = false
	selected_card.selected = true
	
func selection_pair(card: Card, pair: Card): 
	if card.selected or pair.selected:
		card.selected = true
		pair.selected = true
