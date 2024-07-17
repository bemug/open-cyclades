extends Node3D
class_name Hextile
# ------------------------------------------------------------------------------
# Export signals
# ------------------------------------------------------------------------------
signal tile_selected(tile: Hextile)

# ------------------------------------------------------------------------------
# Properties
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Public Methods
# ------------------------------------------------------------------------------
func highlight(b: bool) -> void :
	if(b):
		for nodes: Node in $Meshes.get_children(): 
			for mesh: MeshInstance3D in nodes.get_children():
				if(mesh.name == "InnerMesh"): # TODO hardcoded for the moment
					mesh.transparency = 0 
	else: 
		for nodes: Node in $Meshes.get_children(): 
			for mesh: MeshInstance3D in nodes.get_children():
				if(mesh.name == "InnerMesh"): # TODO hardcoded for the moment
					mesh.transparency = 0.50 
		
# ------------------------------------------------------------------------------
# Listeners (connected to external signals)
# ------------------------------------------------------------------------------
func _on_area_3d_mouse_entered() -> void:
	highlight(true)

func _on_area_3d_mouse_exited() -> void:
	highlight(false)
	
func _on_area_3d_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		var mouse_button: InputEventMouseButton = event as InputEventMouseButton
		if(mouse_button.button_index == MOUSE_BUTTON_LEFT):
			if(!mouse_button.pressed):
				emit_signal("tile_selected", self)
	
