extends Node

@export var gold_label : Label
@export var gold : int = 10


func _ready() -> void:
	gold_label.text = str(gold)


func _on_end_turn_button_end_turn() -> void:
	for offerings in get_tree().get_nodes_in_group("offerings"):
		for offering : CheckBox in offerings.get_children():
			if offering.button_pressed:
				gold -= int(offering.text)
				break
	assert(gold >= 0, "Gold amount is negative")
	gold_label.text = str(gold)
