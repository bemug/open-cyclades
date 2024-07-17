extends Node
class_name Player

@export var currentplayer: int = 1;
@export var playerlist: Dictionary = {1:10,2:10,3:10,4:10,5:10};

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
