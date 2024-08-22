extends Node
class_name Player

enum Action {
	NOTHING,
	PLACE_BOAT,
}

@export var currentplayer: int = 1;
@export var playerlist: Dictionary = {1:10,2:10,3:10,4:10,5:10};
@onready var hexgrid: Hexgrid = %Hexgrid

var current_action : Action = Action.NOTHING

signal gold_changed(gold : String)

func _ready() -> void:
	var str: String = str("Player " , currentplayer , " : " , playerlist[currentplayer]);
	gold_changed.emit(str)

func make_offering(offer : int) -> void:
	playerlist[currentplayer] -= offer
	currentplayer = currentplayer+1;
	if (currentplayer == 6):
		currentplayer = 1
	var str: String = str("Player " , currentplayer , " : " , playerlist[currentplayer]);
	gold_changed.emit(str)

func gold() -> int:
	return playerlist[currentplayer]

func _on_action_panel_action_place_boat() -> void:
	current_action = Action.PLACE_BOAT

func _place_boat(tile: Hextile) -> void:
	hexgrid.add_boat(tile)

func _on_hexgrid_tile_selected(tile: Hextile) -> void:
	if current_action == Action.PLACE_BOAT:
		_place_boat(tile)
		current_action = Action.NOTHING
