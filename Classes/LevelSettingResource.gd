extends Resource

class_name LevelSettingResource

@export var level: int
@export var rows: int
@export var cols: int

func get_rows() -> int:
    return rows

func get_cols() -> int:
    return cols

func get_level() -> int:
    return level

func get_target_pairs() -> int:
    return (rows * cols) / 2
    