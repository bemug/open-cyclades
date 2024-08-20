extends VBoxContainer

signal action_place_boat

func _on_place_boat_pressed() -> void:
	action_place_boat.emit()
