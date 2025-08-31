extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal end_game()
signal tried_secret_ending()

func endGame():
	print("ended game")
	end_game.emit()


func _on_secret_ending_button_pressed() -> void:
	$Click.play()
	tried_secret_ending.emit()
