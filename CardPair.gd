extends Node
class_name CardPair

@onready var player_card = $PlayerHand/AttackExchangePath/PathFollow2D/Card
@onready var boss_card = $BossHand/AttackExchangePath/PathFollow2D/Card
@onready var animation = $AnimationPlayer
@export var pair_type: Card.CardType

signal pair_selected(pair)

func _ready():
	player_card.card_type = pair_type
	boss_card.card_type = pair_type
	player_card.card_selected.connect(_on_card_selected)
	boss_card.card_selected.connect(_on_card_selected)
	
func _on_card_selected(_card: Card):
	player_card.selected = true
	boss_card.selected = true
	emit_signal("pair_selected", self)

func exchange():
	self.animation.play("Exchange")
	
func deselect():
	player_card.selected = false
	boss_card.selected = false
	
func get_highlight_color() -> Color: 
	match pair_type:
		Card.CardType.Attack:
			return Color.from_string("#c52956", Color.RED)
		Card.CardType.Defense:
			return Color.from_string("#4728f6", Color.BLUE)
		Card.CardType.Ability:
			return Color.from_string("#198641", Color.SEA_GREEN)
	return Color.BLACK
