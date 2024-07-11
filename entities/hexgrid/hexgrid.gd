#Reference : https://www.redblobgames.com/grids/hexagons/
extends Node3D

@export var width : int = 8
@export var height : int = 8

# Key: cube coordinates as Vector3
# Value: The Hextile
var hexes : Dictionary = {}
var hextile_res : Resource = preload("res://entities/hextile/hextile.tscn")


func _ready() -> void:
	var hex : Node = hextile_res.instantiate()
	hexes[Vector3(0, 0, 0)] = hex
	add_child(hex)

func _process(delta: float) -> void:
	pass
