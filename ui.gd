extends CanvasLayer

@onready var game_over_panel = $GameOverPanel
@onready var win_panel = $WinPanel


func show_game_over():
	game_over_panel.show()
	win_panel.hide()

func show_win():
	win_panel.show()
	game_over_panel.hide()

func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_home_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
