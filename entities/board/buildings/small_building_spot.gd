extends Node3D
class_name SmallBuildingSpot
#TODO factorize as "selectable" class

signal spot_selected(spot: SmallBuildingSpot)

func _on_area_3d_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		var mouse_button: InputEventMouseButton = event as InputEventMouseButton
		if(mouse_button.button_index == MOUSE_BUTTON_LEFT):
			if(!mouse_button.pressed):
				spot_selected.emit(self)
