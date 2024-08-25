extends VBoxContainer

signal action_place_boat
signal action_buy_philosopher
signal action_buy_priest
signal action_place_dock #TODO specify by type as arg

func _on_place_boat_pressed() -> void:
	action_place_boat.emit()

func _on_get_philosopher_pressed() -> void:
	action_buy_philosopher.emit()

func _on_get_priest_pressed() -> void:
	action_buy_priest.emit()

func _on_create_dock_pressed() -> void:
	action_place_dock.emit()
