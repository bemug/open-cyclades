class_name IslandInfo
# Contains information about an island (tile positions, orientation, type, etc.)
# ------------------------------------------------------------------------------
# Properties
# ------------------------------------------------------------------------------
var id: int # Unique identifier of this island in the board
var type: Tiles.Type
var orientation: Tiles.Orientation # Orientation in degrees used to orientate island scene
var positions: Array[Vector2] # (U, V) positions of every tile of the island

# ------------------------------------------------------------------------------
# Constructor
# ------------------------------------------------------------------------------
func _init(id: int, type: Tiles.Type, orientation: Tiles.Orientation, positions: Array[Vector2]) -> void:
	self.id = id
	self.type = type
	self.orientation = orientation
	self.positions = positions

# ------------------------------------------------------------------------------
# Public Methods
# ------------------------------------------------------------------------------
# Coordinate of an island is always the barycenter of all island's tiles
func get_island_barycenter() -> Vector2:
	var number_of_tiles: int = positions.size()
	var result: Vector2 = Vector2(0, 0)
	for position: Vector2 in positions :
		result += position 
	result /= number_of_tiles

	return result
