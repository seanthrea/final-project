extends Node2D

var score = 0

@onready var label = $UI/Label

var total_coins

func _ready():

	total_coins = get_tree().get_nodes_in_group("coins").size()

func add_score():

	score += 1

	label.text = "Score: " + str(score)

	if score >= total_coins:

		print("YOU WIN")
