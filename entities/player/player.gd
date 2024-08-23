extends Node
class_name Player

enum Action {
	NOTHING,
	PLACE_BOAT,
}

@export var current_player: int = 1;
@onready var hexgrid: Hexgrid = %Hexgrid

var current_action : Action = Action.NOTHING
var philosophers_nb: int = 0
var priests_nb: int = 0
var gold: Dictionary = {1:10,2:10,3:10,4:10,5:10};

signal stats_changed(gold: String, ph: int, pr: int)

func _ready() -> void:
	var str: String = str("Player " , current_player , " : " , gold[current_player]);
	stats_changed.emit(current_player, gold[current_player], philosophers_nb, priests_nb)

func make_offering(offer : int) -> void:
	gold[current_player] -= offer
	current_player = (current_player % 5) + 1
	stats_changed.emit(current_player, gold[current_player], philosophers_nb, priests_nb)

func get_gold() -> int:
	return gold[current_player]

func _on_action_panel_action_place_boat() -> void:
	current_action = Action.PLACE_BOAT

func _place_boat(tile: Hextile) -> void:
	hexgrid.add_boat(tile)

func _on_hexgrid_tile_selected(tile: Hextile) -> void:
	if current_action == Action.PLACE_BOAT:
		_place_boat(tile)
		current_action = Action.NOTHING

func _on_action_panel_action_buy_philosopher() -> void:
	philosophers_nb += 1
	stats_changed.emit(current_player, gold[current_player], philosophers_nb, priests_nb)

func _on_action_panel_action_buy_priest() -> void:
	priests_nb += 1
	stats_changed.emit(current_player, gold[current_player], philosophers_nb, priests_nb)
