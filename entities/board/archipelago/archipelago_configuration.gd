class_name ArchipelagoConfiguration # Abstract class : use implementations
# Define content of any tile of the board 
# (if it is water, an island, what type of island, etc.).

# Q & R parameters used to define board size (see board loader)
# Cube coordinates as Vector3. X=Q, Y=R
var q_param_min: int
var q_param_max: int
var r_param_min: int
var r_param_max: int
var islands: Array[IslandInfo]
var boats: Array[Vector2]

func _init(q_param_min: int, q_param_max: int, r_param_min: int, r_param_max: int, islands: Array[IslandInfo]) -> void:
	self.q_param_min = q_param_min
	self.q_param_max = q_param_max
	self.r_param_min = r_param_min
	self.r_param_max = r_param_max
	self.islands = islands
	self.boats = boats
	
func get_island_info(coordinates: Vector2) -> IslandInfo:
	for island_info: IslandInfo in islands:
		for position: Vector2 in island_info.positions:
			if (position == coordinates):
				return island_info
	return null
	
