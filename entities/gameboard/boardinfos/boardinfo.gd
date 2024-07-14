class_name BoardInfo # Abstract class : use implementations
# Define content of any tile of the board 
# (if it is water, an island, what type of island, etc.).
# ------------------------------------------------------------------------------
# Properties
# ------------------------------------------------------------------------------
# Q & R parameters used to define board size (see board loader)
# Cube coordinates as Vector3. X=Q, Y=R
var q_param_min: int
var q_param_max: int
var r_param_min : int
var r_param_max : int
var islands: Array[IslandInfo]

# ------------------------------------------------------------------------------
# Constructor
# ------------------------------------------------------------------------------
func _init(q_param_min: int, q_param_max: int, r_param_min: int, r_param_max: int, islands: Array[IslandInfo]):
	self.q_param_min = q_param_min
	self.q_param_max = q_param_max
	self.r_param_min = r_param_min
	self.r_param_max = r_param_max
	self.islands = islands
	
# ------------------------------------------------------------------------------
# Public Methods
# ------------------------------------------------------------------------------
# @return Vector2 or null if coordinates does not correspond to an island tile
func get_island_info(coordinates: Vector2):
	for island_info in islands:
		for position in island_info.positions:
			if (position == coordinates):
				return island_info
	return null
	