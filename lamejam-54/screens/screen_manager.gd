extends Node2D

@onready var title_screen: Node2D = $TitleScreen
@onready var test_screen: Node2D = $TestScreen
@onready var ledge_door_screen: Node2D = $LedgeDoorScreen
@onready var table_chair_screen: Node2D = $TableChairScreen
@onready var table_screen: Node2D = $TableScreen


var upwards := 0
var downwards := 0

func _ready() -> void:
	#add_child(title_screen)
	test_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ledge_door_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ledge_door_screen.process_mode = Node.PROCESS_MODE_DISABLED
	table_chair_screen.process_mode = Node.PROCESS_MODE_DISABLED
	
	
	pass


func _on_title_screen_start_game() -> void:
	title_screen.visible = false
	title_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ledge_door_screen.process_mode = Node.PROCESS_MODE_INHERIT
	ledge_door_screen.visible = true


func _on_ledge_door_screen_door_route() -> void:
	ledge_door_screen.visible = false
	ledge_door_screen.process_mode = Node.PROCESS_MODE_DISABLED
	table_chair_screen.process_mode = Node.PROCESS_MODE_INHERIT
	table_chair_screen.visible = true
	downwards += 1


func _on_ledge_door_screen_ledge_route() -> void:
	ledge_door_screen.visible = false
	ledge_door_screen.process_mode = Node.PROCESS_MODE_DISABLED
	test_screen.process_mode = Node.PROCESS_MODE_INHERIT
	test_screen.visible = true
	upwards += 1
	
