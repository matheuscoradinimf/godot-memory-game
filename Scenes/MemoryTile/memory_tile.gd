extends TextureButton

class_name MemoryTile

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage
@onready var sound: AudioStreamPlayer = $Sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reveal(false)

func reveal(s: bool) -> void:
	item_image.visible = s
	frame_image.visible = s
	if s:
		SoundManager.play_sound(sound, SoundManager.SOUND_SELECT_TILE)

func setup(image: Texture2D, frame: Texture2D) -> void:
	frame_image.texture = frame
	item_image.texture = image

func _on_pressed() -> void:
	reveal(true)
	SignalHub.on_tile_selected.emit(self)

func tween_kill() -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "disabled", true, 0)
	tween.tween_property(self, "rotation_degrees", 720, 0.5)
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.5)
	tween.set_parallel(false)
	tween.tween_interval(0.4)
	tween.tween_property(self, "scale", Vector2.ZERO, 0.2)
