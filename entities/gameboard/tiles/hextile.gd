extends Node3D
# ------------------------------------------------------------------------------
# Imports
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Static Constantes
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Export signals
# ------------------------------------------------------------------------------
signal tile_selected(tile)

# ------------------------------------------------------------------------------
# Properties
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Public Methods
# ------------------------------------------------------------------------------
func highlight(b: bool) -> void :
	if(b):
		for nodes in $Meshes.get_children(): 
			for mesh in nodes.get_children():
				if(mesh.name == "InnerMesh"): # TODO hardcoded for the moment
					mesh.transparency = 0 
	else: 
		for nodes in $Meshes.get_children(): 
			for mesh in nodes.get_children():
				if(mesh.name == "InnerMesh"): # TODO hardcoded for the moment
					mesh.transparency = 0.50 
		
# ------------------------------------------------------------------------------
# Listeners (connected to external signals)
# ------------------------------------------------------------------------------
func _on_area_3d_mouse_entered() -> void:
	highlight(true)

func _on_area_3d_mouse_exited() -> void:
	highlight(false)
	
func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if(event.button_index == MOUSE_BUTTON_LEFT):
			if(!event.pressed):
				emit_signal("tile_selected", self)
	
