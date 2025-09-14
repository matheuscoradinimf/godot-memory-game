extends TextureButton

@export var level: int = 1
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ls: LevelSettingResource = LevelDataSelector.get_level_setting(level)
	if ls == null:
		queue_free()
	else:
		label.text = "%dx%d" % [ls.get_rows(), ls.get_cols()]

func _on_pressed() -> void:
	print("level button pressed", level	)
	SignalHub.on_level_selected.emit(level)
