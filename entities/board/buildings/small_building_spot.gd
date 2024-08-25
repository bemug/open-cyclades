extends Node3D
class_name SmallBuildingSpot
#TODO factorize as "selectable" class

var dock_scene_resource: PackedScene = preload("res://entities/board/buildings/small_buildings/dock.tscn")

signal spot_selected(spot: SmallBuildingSpot)

func _on_area_3d_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		var mouse_button: InputEventMouseButton = event as InputEventMouseButton
		if(mouse_button.button_index == MOUSE_BUTTON_LEFT):
			print("add dock")
			if(!mouse_button.pressed):
				spot_selected.emit(self)

func place_dock() -> void:
	var dock : Node3D = dock_scene_resource.instantiate()
	add_child(dock)
