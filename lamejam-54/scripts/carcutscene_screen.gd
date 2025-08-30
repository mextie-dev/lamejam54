extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Stuff/Car/AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal exit_cutscene()

func play():
	animation_player.play("moveCar")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	exit_cutscene.emit()
