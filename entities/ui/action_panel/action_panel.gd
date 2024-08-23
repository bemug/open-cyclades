extends VBoxContainer

signal action_place_boat
signal action_buy_philosopher
signal action_buy_priest

func _on_place_boat_pressed() -> void:
	action_place_boat.emit()

func _on_get_philosopher_pressed() -> void:
	action_buy_philosopher.emit()

func _on_get_priest_pressed() -> void:
	action_buy_priest.emit()
