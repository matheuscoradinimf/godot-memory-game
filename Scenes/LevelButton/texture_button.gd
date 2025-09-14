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



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
