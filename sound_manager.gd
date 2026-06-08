extends Node

@onready var music = $GameSound
@onready var coin = $CoinSound
@onready var death = $DeathSound
@onready var win = $WinSound

func play_coin():
	coin.play()

func play_death():
	death.play()

func play_win():
	win.play()
