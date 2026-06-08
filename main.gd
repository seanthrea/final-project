extends Node2D

@onready var spawn_points = $GhostSpawns.get_children()
@onready var ghost_scene = preload("res://ghost.tscn")

# UI separation (VERY IMPORTANT)
@onready var game_ui = $GameUI
@onready var score_label = $ScoreUI/Label

var score = 0
var total_coins


func _ready():

	get_tree().paused = false

	total_coins = get_tree().get_nodes_in_group("coins").size()
	print("Total coins:", total_coins)

	if GameManager.difficulty == "easy":
		spawn_ghosts(3)
	elif GameManager.difficulty == "medium":
		spawn_ghosts(6)
	elif GameManager.difficulty == "hard":
		spawn_ghosts(9)

	$PauseMenu.hide()


func add_score():

	score += 1
	score_label.text = "COINS: " + str(score)
	SoundManager.play_coin()

	if score >= total_coins:
		SoundManager.play_win()
		game_ui.show_win()
		get_tree().paused = true


func spawn_ghosts(count):

	var used_spawns = []

	for i in range(count):

		await get_tree().process_frame

		var ghost = ghost_scene.instantiate()
		add_child(ghost)

		var spawn = spawn_points[randi() % spawn_points.size()]

		while spawn in used_spawns:
			spawn = spawn_points[randi() % spawn_points.size()]

		used_spawns.append(spawn)

		ghost.global_position = spawn.global_position


func _input(event):

	if event.is_action_pressed("ui_cancel"):
		toggle_pause()


func toggle_pause():

	var pause_menu = $PauseMenu

	if get_tree().paused:
		get_tree().paused = false
		pause_menu.hide()
	else:
		get_tree().paused = true
		pause_menu.show()


# =========================
# GAME STATE FUNCTIONS
# =========================

func game_over():
	SoundManager.play_death()
	game_ui.show_game_over()
	get_tree().paused = true
