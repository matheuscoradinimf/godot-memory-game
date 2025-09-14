extends Control

var moves_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _enter_tree() -> void:
	SignalHub.on_game_over.connect(on_game_over)
	SignalHub.on_exit_selected.connect(on_game_exit_pressed)
	moves_label = $NinePatchRect/VBoxContainer/MovesLabel


func on_game_over(moves_taken: int) -> void:
	moves_label.text = "You took %d moves" % moves_taken
	show()

func on_game_exit_pressed() -> void:
	print("game over ui exit button pressed")
	hide()
