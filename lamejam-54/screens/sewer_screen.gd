extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var lock_screen: Node2D = $LockScreen

@onready var locked_door_button: Button = $Stuff/Door/LockedDoorButton
@onready var unlocked_door_button: Button = $Stuff/Door/UnlockedDoorButton

signal lockeddoor_route()
signal ladder_route()
signal ventexit_route()

func _ready() -> void:
	animation_player.play("fadeIn")

func _on_lockeddoor_button_pressed() -> void:
	lock_screen.visible = true



func _on_ladder_button_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	ladder_route.emit()

func enteredCode():
	lock_screen.queue_free()
	locked_door_button.visible = false
	unlocked_door_button.visible = true

func exit():
	pass


func _on_unlocked_door_button_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("unlocked door")
	lockeddoor_route.emit()


func _on_vent_exit_button_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	print("worked")
	ventexit_route.emit()
