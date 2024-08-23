extends PanelContainer

@onready var player_value_label: Label = $Commands/HBoxContainer/PlayerValue
@onready var gold_value_label: Label = $Commands/HBoxContainer/GoldValue
@onready var ph_value_label: Label = $Commands/HBoxContainer/PhValue
@onready var pr_value_label: Label = $Commands/HBoxContainer/PrValue
@onready var player: Player = %Player

func _on_player_stats_changed(player: int, gold: int, ph: int, pr: int) -> void:
	player_value_label.text = str(player)
	gold_value_label.text = str(gold)
	ph_value_label.text = str(ph)
	pr_value_label.text = str(pr)

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
			if player.get_gold() < int(offering.text):
				offering.disabled = true
