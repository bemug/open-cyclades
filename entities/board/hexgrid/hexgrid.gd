@tool
extends Node3D
class_name Hexgrid
#Reference : https://www.redblobgames.com/grids/hexagons/

var archipelago_config: ArchipelagoConfiguration = FivePlayersArchipelago.new()
var tiles : Dictionary = {} # Map<2DCoordinates, TileScene>
var tile_size : float = 1

signal tile_selected(tile: Hextile)

func _ready() -> void:
	load_board()
	
func _process(delta: float) -> void:
	pass
	
func load_board() -> void:
	var q_min: int = archipelago_config.q_param_min
	var q_max: int = archipelago_config.q_param_max
	var r_min: int = archipelago_config.r_param_min
	var r_max: int = archipelago_config.r_param_max
	for q: int in range(q_min, q_max + 1):
		for r: int in range(r_min, r_max + 1):
			var s : int = -q-r
			if abs(s) > q_max:
				continue
			var coord : Vector2 = Vector2(q, r)
			
			if(tiles.has(coord)):
				# ignore all island tiles already built
				continue
				
			# Instantiate tile scene on this position
			var island_info: IslandInfo = archipelago_config.get_island_info(coord)
			
			var tile_scene: Hextile
			if(island_info != null):
				var tile_scene_resource: PackedScene = Tiles.getTypePackedScene(island_info.type)
				tile_scene = tile_scene_resource.instantiate()
				var tile_position: Vector3 = hex_to_pixel(island_info.get_island_barycenter())
				tile_scene.position = tile_position
				var tile_direction: Vector3 = Vector3(0, 0, -1).rotated(Vector3.UP, - 2 * island_info.orientation * PI / 6.0)
				tile_scene.look_at_from_position(tile_position, tile_position + tile_direction, Vector3.UP)
				for position: Vector2  in island_info.positions:
					tiles[position] = tile_scene
			else:
				# Water tile 
				var tile_scene_resource: PackedScene = Tiles.getTypePackedScene(Tiles.Type.WaterTile)
				tile_scene = tile_scene_resource.instantiate()
				tile_scene.position = hex_to_pixel(coord)
				tiles[coord] = tile_scene
				
			add_child(tile_scene)
			tile_scene.connect("tile_selected", Callable(self, "_on_tile_selection"))
			
			if (coord in archipelago_config.boats):
				tile_scene.add_boat()

func get_tile_coordinates(tile: Hextile) -> Vector2:
	for coord: Vector2 in tiles:
		if(tiles[coord] == tile):
			return coord
	# Error case
	return Vector2(0, 0)
	
func hex_to_pixel(coord : Vector2) -> Vector3:
	var x : float = tile_size * (sqrt(3) * coord.x  +  sqrt(3)/2 * coord.y)
	var y : float = tile_size * (3./2 * coord.y)
	return Vector3(x, 0, y)

func _on_tile_selection(tile: Hextile) -> void:
	tile_selected.emit(tile)

func add_boat(tile: Hextile) -> void:
	tile.add_boat()
