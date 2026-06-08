extends CanvasLayer

@onready var game_over_panel = $GameOverPanel
@onready var win_panel = $WinPanel


func show_game_over():

	game_over_panel.show()

	var tween = create_tween()
	tween.set_loops()

	tween.tween_property(
		$GameOverPanel/VBoxContainer/GameOverLabel,
		"modulate:a",
		0.3,
		0.4
	)

	tween.tween_property(
		$GameOverPanel/VBoxContainer/GameOverLabel,
		"modulate:a",
		1.0,
		0.4
	)

func show_win():

	game_over_panel.hide()

	win_panel.show()

	win_panel.modulate = Color(1, 1, 1, 0)

	var tween = create_tween()
	
	var title = $WinPanel/VBoxContainer/WinLabel

	var pulse = create_tween()
	pulse.set_loops()

	pulse.tween_property(
		title,
		"scale",
		Vector2(1.1, 1.1),
		0.5
	)

	pulse.tween_property(
		title,
		"scale",
		Vector2(1.0, 1.0),
		0.5
	)
	tween.tween_property(
		win_panel,
		"modulate:a",
		1.0,
		0.4
	)

func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_home_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
