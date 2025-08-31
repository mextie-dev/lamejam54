extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal toilet_route()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_toilet_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	toilet_route.emit()


func exit():
	pass
