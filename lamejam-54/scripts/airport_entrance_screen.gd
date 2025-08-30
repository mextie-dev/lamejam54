extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal airport_route()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_airport_door_button_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	airport_route.emit()


func exit():
	pass
