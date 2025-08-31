extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal table_route()
signal chair_route()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_table_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	table_route.emit()


func _on_chair_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	chair_route.emit()

func exit():
	pass
