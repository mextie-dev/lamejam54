extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal door_route()
signal ledge_route()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_door_button_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(1.5).timeout
	print("worked")
	door_route.emit()


func _on_ledge_button_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(1.5).timeout
	print("worked")
	ledge_route.emit()

func exit():
	pass
