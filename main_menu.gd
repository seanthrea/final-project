extends Control

func _on_easy_pressed():
	GameManager.difficulty = "easy"
	get_tree().change_scene_to_file("res://main.tscn")

func _on_hard_pressed():
	GameManager.difficulty = "hard"
	get_tree().change_scene_to_file("res://main.tscn")

func _on_meduim_pressed() -> void:
	GameManager.difficulty = "medium"
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
