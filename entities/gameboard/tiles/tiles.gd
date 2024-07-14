@tool
class_name Tiles
# Static class. Contains any preloaded tile scenes.
# TODO: (later) load them in game loading phase.
# ------------------------------------------------------------------------------
# Tile Type
# ------------------------------------------------------------------------------
static var WATER_TILE : Resource = preload("res://entities/gameboard/tiles/water/watertile.tscn")
static var ISLAND_1TILE : Resource = preload("res://entities/gameboard/tiles/islands/island1tile.tscn")
static var ISLAND_2TILES : Resource = preload("res://entities/gameboard/tiles/islands/island2tiles.tscn")
static var ISLAND_3TILES_ISHAPE : Resource = preload("res://entities/gameboard/tiles/islands/island3tilesishape.tscn")
static var ISLAND_3TILES_VSHAPE : Resource = preload("res://entities/gameboard/tiles/islands/island3tilesvshape.tscn")
static var ISLAND_3TILES_TRIANGLE : Resource = preload("res://entities/gameboard/tiles/islands/island3tilestriangle.tscn")
static var ISLAND_4TILES_ISHAPE : Resource = preload("res://entities/gameboard/tiles/islands/island4tilesishape.tscn")
static var ISLAND_4TILES_SQUARE : Resource = preload("res://entities/gameboard/tiles/islands/island4tilessquare.tscn")

enum Type {WaterTile, 
	Island1Tile, 
	Island2Tiles, 
	Island3TilesIShape, 
	Island3TilesVShape, 
	Island3TilesTriangle, 
	Island4TilesIShape, 
	Island4TilesSquare}
	
static func getTypeResource(type: Type) -> Resource:
	match type:
		Type.Island1Tile:
			return ISLAND_1TILE
		Type.Island2Tiles:
			return ISLAND_2TILES
		Type.Island3TilesIShape:
			return ISLAND_3TILES_ISHAPE
		Type.Island3TilesVShape:
			return ISLAND_3TILES_VSHAPE
		Type.Island3TilesTriangle:
			return ISLAND_3TILES_TRIANGLE
		Type.Island4TilesIShape:
			return ISLAND_4TILES_ISHAPE
		Type.Island4TilesSquare:
			return ISLAND_4TILES_SQUARE
		Type.WaterTile, _: # also default case
			return WATER_TILE
	
# ------------------------------------------------------------------------------
# Tile Orientation
# ------------------------------------------------------------------------------
# DO NOT MODIFY ENUM CONSTANT VALUE.
enum Orientation {NorthWest = 0, 
	NorthEast = 1, 
	East = 2, 
	SouthEast = 3, 
	SouthWest = 4, 
	West = 5}

static var NORTH_WEST : Vector3 = Vector3(-sqrt(3)/2, 0, -0.75)
static var NORTH_EAST : Vector3 = Vector3(sqrt(3)/2, 0, -0.75)
static var EAST : Vector3 = Vector3(sqrt(3)/2, 0, 0)
static var SOUTH_EAST : Vector3 = Vector3(sqrt(3)/2, 0, 0.75)
static var SOUTH_WEST : Vector3 = Vector3(-sqrt(3)/2, 0, 0.75)
static var WEST : Vector3 = Vector3(-sqrt(3)/2, 0, 0)

static func getOrientationVector(orientation: Tiles.Orientation) -> Vector3:
	match orientation:
		Orientation.NorthEast:
			return NORTH_EAST
		Orientation.East:
			return EAST
		Orientation.SouthEast:
			return SOUTH_EAST
		Orientation.SouthWest:
			return SOUTH_WEST
		Orientation.West:
			return WEST
		Orientation.NorthWest, _: # also default case
			return NORTH_WEST
