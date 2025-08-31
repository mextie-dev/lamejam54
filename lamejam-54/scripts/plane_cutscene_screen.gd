extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Stuff/Plane/AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var exitingArea := 0

signal exit_cutscene()
signal exit_cutscene_from_mountain()

func play():
	animation_player.play("flyPlane")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if exitingArea == 0:
		exit_cutscene.emit()
	elif exitingArea == 1:
		exit_cutscene_from_mountain.emit()
		
