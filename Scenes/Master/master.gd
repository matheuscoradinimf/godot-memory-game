extends Control


@onready var music: AudioStreamPlayer = $Music
@onready var game: Control = $Game
@onready var main: Control = $Main

func _ready() -> void:
	on_show_main()
	
func _enter_tree() -> void:
	SignalHub.on_level_selected.connect(on_show_game)
	SignalHub.on_exit_selected.connect(on_show_main)

func show_game(s: bool) -> void:
	print(s)
	game.visible = s
	main.visible = !s

func on_show_game(level: int) -> void:
	show_game(true)
	SoundManager.play_sound(music, SoundManager.SOUND_IN_GAME)

func on_show_main() -> void:
	show_game(false)
	SoundManager.play_sound(music, SoundManager.SOUND_MAIN_MENU)