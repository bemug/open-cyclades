extends PanelContainer

@onready var gold_value_label: Label = $Commands/HBoxContainer/GoldValue
@onready var player: Player = %Player

func _on_player_gold_changed(gold: String) -> void:
	gold_value_label.text = str(gold)

func _on_end_turn_button_button_down() -> void:
	#Execute offering
	for offerings: Node in get_tree().get_nodes_in_group("offerings"):
		for offering: CheckBox in offerings.get_children():
			if offering.button_pressed:
				player.make_offering(int(offering.text))
				break;
	#Refresh UI
	for offerings: Node in get_tree().get_nodes_in_group("offerings"):
		for offering: CheckBox in offerings.get_children():
			offering.disabled = false
			offering.button_pressed = false
			if player.gold() < int(offering.text):
				offering.disabled = true
