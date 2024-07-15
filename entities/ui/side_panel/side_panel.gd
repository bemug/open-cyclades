extends PanelContainer

func _on_player_gold_changed(gold: String) -> void:
	$Commands/HBoxContainer/GoldValue.text = str(gold)

func _on_end_turn_button_button_down() -> void:
	#Execute offering
	for offerings in get_tree().get_nodes_in_group("offerings"):
		for offering : CheckBox in offerings.get_children():
			if offering.button_pressed:
				%Player.make_offering(int(offering.text))
				break;
	#Refresh UI
	for offerings in get_tree().get_nodes_in_group("offerings"):
		for offering : CheckBox in offerings.get_children():
			offering.disabled = false
			offering.button_pressed = false
			if %Player.gold() < int(offering.text):
				offering.disabled = true
