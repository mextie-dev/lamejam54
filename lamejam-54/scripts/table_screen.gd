extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal paper_route()
@onready var table_face: Node2D = $Stuff/TableFace
@onready var paper_button: Button = $Stuff/TableFace/PaperButton

@onready var exit_paper: Button = $Stuff/Paper/ExitPaper
@onready var paper: Node2D = $Stuff/Paper

signal exit_paper_pressed()

func _ready() -> void:
	exit_paper.disabled = true
	animation_player.play("fadeIn")

func _on_paper_button_pressed() -> void:
	table_face.visible = false
	showPaper()

func showPaper():
	exit_paper.disabled = false
	
	paper.visible = true
	exit_paper.disabled = false
	

func exit():
	pass


func _on_exit_paper_pressed() -> void:
	animation_player.play_backwards("fadeIn")
	await get_tree().create_timer(2).timeout
	self.visible = false
	exit_paper_pressed.emit()
