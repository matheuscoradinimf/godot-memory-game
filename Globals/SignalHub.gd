extends Node

signal on_level_selected(level: int)
signal on_exit_selected()
signal on_tile_selected(tile: MemoryTile)
signal on_game_over(moves_taken: int)