extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal rope_route()
signal bush_route()
signal planeexit_route()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_rope_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	rope_route.emit()


func _on_bush_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	bush_route.emit()

func exit():
	pass


func _on_plane_exit_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	planeexit_route.emit()
