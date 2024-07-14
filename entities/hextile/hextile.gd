extends Node3D


func _on_area_3d_mouse_entered() -> void:
	$HexTileInnerMesh.transparency = 0

func _on_area_3d_mouse_exited() -> void:
	$HexTileInnerMesh.transparency = 0.50
