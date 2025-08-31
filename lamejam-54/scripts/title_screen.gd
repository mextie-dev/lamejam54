extends Node2D

@onready var animation_player: AnimationPlayer = $Stuff/AnimationPlayer

signal start_game()

func _on_button_pressed() -> void:
	$Click.play()
	animation_player.play("fadeOutEverything")
	

func endedAnim():
	start_game.emit()
	print("works")
