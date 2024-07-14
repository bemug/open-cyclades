#Reference : https://www.redblobgames.com/grids/hexagons/
@tool
extends Node3D

@export var q_max: int = 3
@export var r_max : int = 5

# Key: cube coordinates as Vector3. X=Q, Y=R
# Value: The Hextile
var hexes : Dictionary = {}
var hextile_res : Resource = preload("res://entities/hextile/hextile.tscn")
var size : float = 1 #TODO get tile size


func _ready() -> void:
	for q in range(-q_max, q_max + 1):
		for r in range(-r_max, r_max + 1):
			var s : int = -q-r
			if abs(s) > q_max:
				continue
			var coord : Vector2 = Vector2(q, r)
			print(coord)
			var hex : Node3D = hextile_res.instantiate()
			hex.position = hex_to_pixel(coord)
			hexes[coord] = hex
			add_child(hex)

func _process(delta: float) -> void:
	pass

func hex_to_pixel(coord : Vector2) -> Vector3:
	var x : float = size * (sqrt(3) * coord.x  +  sqrt(3)/2 * coord.y)
	var y : float = size * (3./2 * coord.y)
	return Vector3(x, 0, y)
