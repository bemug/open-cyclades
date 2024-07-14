extends Node

@export var gold : int = 10

signal gold_changed(gold : int)


func _ready() -> void:
	gold_changed.emit(gold)

func make_offering(offer : int) -> void:
	gold -= offer
	gold_changed.emit(gold)
