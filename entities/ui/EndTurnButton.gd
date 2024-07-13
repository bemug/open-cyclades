extends Button

signal end_turn

func _on_button_down() -> void:
	end_turn.emit()
	#Clear the UI
	for offerings in get_tree().get_nodes_in_group("offerings"):
		for offering : CheckBox in offerings.get_children():
			offering.disabled = false
			offering.button_pressed = false
			if %Player.gold < int(offering.text):
				offering.disabled = true
