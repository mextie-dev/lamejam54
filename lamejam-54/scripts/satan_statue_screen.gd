extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal vent_exit_route()
signal hell_door_route()
signal satan_offered()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_vent_exit_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	vent_exit_route.emit()


func _on_hell_door_button_pressed() -> void:
	$Click.play()
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	hell_door_route.emit()
	
func offerToSatan():
	$Click.play()
	satan_offered.emit()

func exit():
	pass
