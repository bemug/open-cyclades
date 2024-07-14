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
func _on_selection_area_mouse_entered():
	print("Hello boat")
	$BoatMeshPlaceholder.transparency = 0

func _on_selection_area_mouse_exited():
	print("Byebye boat")
	if(!selected):
		$BoatMeshPlaceholder.transparency = 0.25
	
func _on_selection_area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if(event.button_index == MOUSE_BUTTON_LEFT):
			if(!event.pressed):
				selected = true
	
# ------------------------------------------------------------------------------
# Properties
# ------------------------------------------------------------------------------
var selected: bool = false




