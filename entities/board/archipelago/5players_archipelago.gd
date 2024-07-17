class_name FivePlayersArchipelago
extends ArchipelagoConfiguration
# ------------------------------------------------------------------------------
# Constructor
# ------------------------------------------------------------------------------
func _init() -> void:
	self.q_param_min = -5
	self.q_param_max = 5
	self.r_param_min = -5
	self.r_param_max = 5
	self.islands = [
		IslandInfo.new(
			1, 
			Tiles.Type.Island2Tiles, 
			Tiles.Orientation.NorthWest,  
			[Vector2(3, -5), Vector2(3, -4)]),
		IslandInfo.new(
			2, 
			Tiles.Type.Island4TilesSquare, 
			Tiles.Orientation.NorthWest,  
			[Vector2(-1, -4), Vector2(0, -4), Vector2(-2, -3), Vector2(-1, -3)]),
		IslandInfo.new(
			3, 
			Tiles.Type.Island2Tiles, 
			Tiles.Orientation.East,  
			[Vector2(2, -2), Vector2(3, -2)]),
		IslandInfo.new(
			4, 
			Tiles.Type.Island2Tiles, 
			Tiles.Orientation.NorthWest, 
			[Vector2(0, -2), Vector2(0, -1)]),
		IslandInfo.new(
			5, 
			Tiles.Type.Island2Tiles, 
			Tiles.Orientation.NorthEast, 
			[Vector2(5, -2), Vector2(4, -1)]),
		IslandInfo.new(
			6, 
			Tiles.Type.Island1Tile, 
			Tiles.Orientation.NorthWest,  
			[Vector2(-3, -1)]),
		IslandInfo.new(
			7, 
			Tiles.Type.Island1Tile, 
			Tiles.Orientation.NorthWest,  
			[Vector2(1, 0)]),
		IslandInfo.new(
			8, 
			Tiles.Type.Island2Tiles, 
			Tiles.Orientation.NorthWest,  
			[Vector2(-2, 0), Vector2(-2, 1)]),
		IslandInfo.new(
			9, 
			Tiles.Type.Island3TilesVShape, 
			Tiles.Orientation.NorthWest,  
			[Vector2(-5, 1), Vector2(-5, 2), Vector2(-4, 2)]),
		IslandInfo.new(
			10, 
			Tiles.Type.Island1Tile, 
			Tiles.Orientation.NorthWest, 
			[Vector2(1, 2)]),
		IslandInfo.new(
			11, 
			Tiles.Type.Island4TilesIShape, 
			Tiles.Orientation.NorthEast,  
			[Vector2(4, 1), Vector2(3, 2), Vector2(2, 3), Vector2(1, 4)]),
		IslandInfo.new(
			12, 
			Tiles.Type.Island3TilesTriangle, 
			Tiles.Orientation.NorthWest,  
			[Vector2(-3, 3), Vector2(-4, 4), Vector2(-3, 4)]),
		IslandInfo.new(
			13, 
			Tiles.Type.Island3TilesIShape, 
			Tiles.Orientation.NorthWest,  
			[Vector2(-1, 3), Vector2(-1, 4), Vector2(-1, 5)]),
		]
