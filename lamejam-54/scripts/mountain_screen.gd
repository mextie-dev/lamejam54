extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal pressed_goat()
signal ladder_exit()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_ladder_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	ladder_exit.emit()


func _on_goat_button_pressed() -> void:
	$Click.play()
	pressed_goat.emit()

func exit():
	pass
