extends Node
class_name Player

enum Action {
	NOTHING,
	PLACE_BOAT,
}

@export var currentplayer: int = 1;
@export var playerlist: Dictionary = {1:10,2:10,3:10,4:10,5:10};

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

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouse_button: InputEventMouseButton = event as InputEventMouseButton
		if mouse_button.button_index == MOUSE_BUTTON_LEFT:
			if !mouse_button.pressed:
				if current_action == Action.PLACE_BOAT:
					print("Placing boat at pixel " + str(get_viewport().get_mouse_position()))
					current_action = Action.NOTHING
