extends Control

const MEMORY_TILE = preload("res://Scenes/MemoryTile/memory_tile.tscn")

@onready var tile_grid: GridContainer = $HB/TileGrid
@onready var reveal_timer: Timer = $RevealTimer

var selected_tiles: Array[MemoryTile] = []
var matched_tiles: Array[MemoryTile] = []
var _moves: int = 0
var _pairs: int = 0
var moves_label: Label
var pairs_label: Label
var target_pairs: int

func allow_selecting_tiles(tile: MemoryTile, s: bool) -> void:
	tile.disabled = !s

func hide_tiles() -> void:
	for tile in tile_grid.get_children():
		if tile not in matched_tiles:
			tile.reveal(false)
			allow_selecting_tiles(tile, true)

func check_for_match() -> void:
	if selected_tiles[0].item_image.texture == selected_tiles[1].item_image.texture:
		print("match")
		for tile in selected_tiles:
			tile.tween_kill()
		matched_tiles.append(selected_tiles[1])
		selected_tiles.clear()
		_pairs += 1
		pairs_label.text = "%1d/%1d" % [_pairs, target_pairs]

	else:
		print("no match")
		for tile in tile_grid.get_children():
			allow_selecting_tiles(tile, false)
		reveal_timer.start()
		selected_tiles.clear()

func _enter_tree() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_tile_selected.connect(on_tile_selected)
	moves_label = $HB/MC/VB/HB/MovesLabel
	pairs_label = $HB/MC/VB/HB2/PairsLabel


func on_tile_selected(tile: MemoryTile) -> void:
	selected_tiles.append(tile)
	if selected_tiles.size() == 2:
		check_for_match()
		_moves += 1
		moves_label.text = "%02d" % _moves
	allow_selecting_tiles(tile, false)
	if _pairs == target_pairs:
		SignalHub.on_game_over.emit(_moves)


func add_memory_tile(image: Texture2D, frame: Texture2D) -> void:
	var mt = MEMORY_TILE.instantiate()
	tile_grid.add_child(mt)
	mt.setup(image, frame)
	

func on_level_selected(level: int) -> void:
	var ls = LevelDataSelector.get_level_selection(level)
	var fi = ImageManager.get_random_frame_image()

	target_pairs = ls.get_target_pairs()

	moves_label.text = "00"
	pairs_label.text = "0/%d" % target_pairs

	tile_grid.columns = ls.get_num_cols()
	for child in tile_grid.get_children():
		child.queue_free()

	var selected_images = ls.get_selected_images()
	
	for im in selected_images:
		add_memory_tile(im, fi)

	_moves = 0
	_pairs = 0


func _on_exit_button_pressed() -> void:
	print("exit button pressed")
	SignalHub.on_exit_selected.emit()
	for tile in tile_grid.get_children():
		tile.queue_free()


func _on_reveal_timer_timeout() -> void:
	hide_tiles()		
