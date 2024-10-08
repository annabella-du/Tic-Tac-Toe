extends Node2D

@onready var global = get_node("/root/global")
@onready var result_label: Label = %ResultLabel
@onready var click_sfx: AudioStreamPlayer2D = $ClickSFX

var next_scene : String

func _ready() -> void:
	if global.current_mode == "two_players":
		match global.result:
			0: result_label.text = "It's a Tie!"
			1: result_label.text = "Player 1 Wins!"
			2: result_label.text = "Player 2 Wins!"
	else:
		match global.result:
			0: result_label.text = "It's a Tie!"
			1: result_label.text = "You Win!"
			2: result_label.text = "You Lose :'("

func _on_play_again_button_pressed() -> void:
	click_sfx.play()
	next_scene = global.current_mode

func _on_main_menu_button_pressed() -> void:
	click_sfx.play()
	next_scene = "main_menu"

func _on_click_sfx_finished() -> void:
	global.load_scene(next_scene)
