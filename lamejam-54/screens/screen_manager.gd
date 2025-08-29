extends Node2D

@onready var title_screen: Node2D = $TitleScreen
@onready var test_screen: Node2D = $TestScreen


func _ready() -> void:
	#add_child(title_screen)
	test_screen.process_mode = Node.PROCESS_MODE_DISABLED
	
	pass


func _on_title_screen_start_game() -> void:
	title_screen.visible = false
	title_screen.process_mode = Node.PROCESS_MODE_DISABLED
	test_screen.process_mode = Node.PROCESS_MODE_INHERIT
	test_screen.visible = true
