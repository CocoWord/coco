extends Camera2D

@export var tile_map: TileMapLayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var map_rect = tile_map.get_used_rect()
	var tile_size = tile_map.cell_quadrant_size
	var world_size_in_pixels = map_rect.size *tile_size
	limit_right = world_size_in_pixels.x
	limit_bottom = world_size_in_pixels.y
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
