extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal vent_route()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_vent_button_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	vent_route.emit()


func exit():
	pass
