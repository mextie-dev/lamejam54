extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal got_cross()
signal bushexit_route()
@onready var cross: Node2D = $Stuff/Cross
func _ready() -> void:
	animation_player.play("fadeIn")

func _on_cross_button_pressed() -> void:
	$Click.play()
	print("got cross")
	cross.hide()
	got_cross.emit()


func _on_bush_exit_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	bushexit_route.emit()

func exit():
	pass
