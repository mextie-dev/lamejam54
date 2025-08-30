extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal bathroomdoor_route()
signal plane_route()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_bathroom_door_button_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	bathroomdoor_route.emit()


func _on_plane_button_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	plane_route.emit()

func exit():
	pass
