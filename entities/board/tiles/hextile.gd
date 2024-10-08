extends Node3D
class_name Hextile

var boat: Boat
var boat_scene_resource: PackedScene = preload("res://entities/board/tokens/boat/boat.tscn")

signal tile_selected(tile: Hextile)
signal spot_selected(spot: SmallBuildingSpot)

func highlight(b: bool) -> void :
		for node: Node in $Meshes.get_children(): 
			for child: Node in node.get_children():
				if(child.name == "InnerMesh"): # TODO hardcoded for the moment
					var mesh: MeshInstance3D = child as MeshInstance3D
					if(b):
						mesh.transparency = 0 
					else: 
						mesh.transparency = 0.50 

func _on_area_3d_mouse_entered() -> void:
	highlight(true)

func _on_area_3d_mouse_exited() -> void:
	highlight(false)
	
func _on_area_3d_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		var mouse_button: InputEventMouseButton = event as InputEventMouseButton
		if(mouse_button.button_index == MOUSE_BUTTON_LEFT):
			if(!mouse_button.pressed):
				tile_selected.emit(self)
	
func add_boat() -> void:
	if not boat:
		boat = boat_scene_resource.instantiate()
		boat.rotate(Vector3.MODEL_TOP, 1)
		add_child(boat)
	boat.increment_number()

func _on_small_building_spot_spot_selected(spot: SmallBuildingSpot) -> void:
	spot_selected.emit(spot)
