extends Node2D

@onready var title_screen: Node2D = $TitleScreen
@onready var test_screen: Node2D = $TestScreen
@onready var ledge_door_screen: Node2D = $LedgeDoorScreen
@onready var table_chair_screen: Node2D = $TableChairScreen
@onready var table_screen: Node2D = $TableScreen
@onready var chair_screen: Node2D = $ChairScreen
@onready var parking_lot_screen: Node2D = $ParkingLotScreen
@onready var sewer_screen: Node2D = $SewerScreen
@onready var car_cutscene_screen: Node2D = $CarCutsceneScreen
@onready var airport_entrance_screen: Node2D = $AirportEntranceScreen
@onready var airport_screen: Node2D = $AirportScreen
@onready var bathroom_screen: Node2D = $BathroomScreen



var run := false

var hasKnife := false


var upwards := 0
var downwards := 0

func _ready() -> void:
	#add_child(title_screen)
	test_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ledge_door_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ledge_door_screen.process_mode = Node.PROCESS_MODE_DISABLED
	table_chair_screen.process_mode = Node.PROCESS_MODE_DISABLED
	table_screen.process_mode = Node.PROCESS_MODE_DISABLED
	parking_lot_screen.process_mode = Node.PROCESS_MODE_DISABLED
	sewer_screen.process_mode = Node.PROCESS_MODE_DISABLED
	car_cutscene_screen.process_mode = Node.PROCESS_MODE_DISABLED
	airport_entrance_screen.process_mode = Node.PROCESS_MODE_DISABLED
	airport_screen.process_mode = Node.PROCESS_MODE_DISABLED
	bathroom_screen.process_mode = Node.PROCESS_MODE_DISABLED
	
	
	pass

func _process(delta: float) -> void:
	#print(hasKnife)
	pass



func returnToStart():
	#print(title_screen.process_mode)
	#ledge_door_screen.visible = false
	#table_chair_screen.visible = false
	#table_screen.visible = false
	#
	#title_screen.process_mode = Node.PROCESS_MODE_INHERIT
	#title_screen.visible = true
	#$TitleScreen/Stuff/AnimationPlayer.play("fadeInEverything")
	
	
	pass

func _on_exit_paper_button_pressed():
	$TableChairScreen/AnimationPlayer.play("fadeIn")
	table_screen.visible = false
	table_screen.process_mode = Node.PROCESS_MODE_DISABLED
	table_chair_screen.process_mode = Node.PROCESS_MODE_INHERIT
	table_chair_screen.visible = true
	downwards += 1

func _on_title_screen_start_game() -> void:
	print("start game")
	title_screen.visible = false
	title_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ledge_door_screen.process_mode = Node.PROCESS_MODE_INHERIT
	$LedgeDoorScreen/AnimationPlayer.play("fadeIn")
	
	if run:
		ledge_door_screen.visible = true
		print("sheeeeesh")
	else: 
		ledge_door_screen.visible = true
		run = true
		


func _on_ledge_door_screen_door_route() -> void:
	$TableChairScreen/AnimationPlayer.play("fadeIn")
	ledge_door_screen.visible = false
	ledge_door_screen.process_mode = Node.PROCESS_MODE_DISABLED
	table_chair_screen.process_mode = Node.PROCESS_MODE_INHERIT
	table_chair_screen.visible = true
	downwards += 1


func _on_ledge_door_screen_ledge_route() -> void:
	$ParkingLotScreen/AnimationPlayer.play("fadeIn")
	ledge_door_screen.visible = false
	ledge_door_screen.process_mode = Node.PROCESS_MODE_DISABLED
	parking_lot_screen.process_mode = Node.PROCESS_MODE_INHERIT
	parking_lot_screen.visible = true
	upwards += 1
	


func _on_table_chair_screen_table_route() -> void:
	$TableScreen/AnimationPlayer.play("fadeIn")
	table_chair_screen.visible = false
	table_screen.restart_room()
	table_chair_screen.process_mode = Node.PROCESS_MODE_DISABLED
	table_screen.process_mode = Node.PROCESS_MODE_INHERIT
	table_screen.visible = true


func _on_table_chair_screen_chair_route() -> void:
	$ChairScreen/AnimationPlayer.play("fadeIn")
	table_chair_screen.visible = false
	table_chair_screen.process_mode = Node.PROCESS_MODE_DISABLED
	chair_screen.process_mode = Node.PROCESS_MODE_INHERIT
	chair_screen.visible = true


func _on_chair_screen_vent_route() -> void:
	$SewerScreen/AnimationPlayer.play("fadeIn")
	chair_screen.visible = false
	chair_screen.process_mode = Node.PROCESS_MODE_DISABLED
	sewer_screen.process_mode = Node.PROCESS_MODE_INHERIT
	sewer_screen.visible = true


func _on_table_screen_got_knife() -> void:
	hasKnife = true


func _on_sewer_screen_ladder_route() -> void:
	$ParkingLotScreen/AnimationPlayer.play("fadeIn")
	sewer_screen.visible = false
	sewer_screen.process_mode = Node.PROCESS_MODE_DISABLED
	parking_lot_screen.process_mode = Node.PROCESS_MODE_INHERIT
	parking_lot_screen.visible = true
	upwards += 1


func _on_parking_lot_screen_manhole_route() -> void:
	$SewerScreen/AnimationPlayer.play("fadeIn")
	parking_lot_screen.visible = false
	parking_lot_screen.process_mode = Node.PROCESS_MODE_DISABLED
	sewer_screen.process_mode = Node.PROCESS_MODE_INHERIT
	sewer_screen.visible = true


func _on_parking_lot_screen_car_route() -> void:
	$CarCutsceneScreen/AnimationPlayer.play("moveCar")
	parking_lot_screen.visible = false
	parking_lot_screen.process_mode = Node.PROCESS_MODE_DISABLED
	car_cutscene_screen.process_mode = Node.PROCESS_MODE_INHERIT
	car_cutscene_screen.visible = true


func _on_car_cutscene_screen_exit_cutscene() -> void:
	$AirportEntranceScreen/AnimationPlayer.play("fadeIn")
	car_cutscene_screen.visible = false
	car_cutscene_screen.process_mode = Node.PROCESS_MODE_DISABLED
	airport_entrance_screen.process_mode = Node.PROCESS_MODE_INHERIT
	airport_entrance_screen.visible = true


func _on_airport_entrance_screen_airport_route() -> void:
	$AirportScreen/AnimationPlayer.play("fadeIn")
	airport_entrance_screen.visible = false
	airport_entrance_screen.process_mode = Node.PROCESS_MODE_DISABLED
	airport_screen.process_mode = Node.PROCESS_MODE_INHERIT
	airport_screen.visible = true


func _on_bathroom_screen_toilet_route() -> void:
	$SewerScreen/AnimationPlayer.play("fadeIn")
	bathroom_screen.visible = false
	bathroom_screen.process_mode = Node.PROCESS_MODE_DISABLED
	sewer_screen.process_mode = Node.PROCESS_MODE_INHERIT
	sewer_screen.visible = true


func _on_airport_screen_bathroomdoor_route() -> void:
	$BathroomScreen/AnimationPlayer.play("fadeIn")
	airport_screen.visible = false
	airport_screen.process_mode = Node.PROCESS_MODE_DISABLED
	bathroom_screen.process_mode = Node.PROCESS_MODE_INHERIT
	bathroom_screen.visible = true


func _on_sewer_screen_ventexit_route() -> void:
	$TableChairScreen/AnimationPlayer.play("fadeIn")
	sewer_screen.visible = false
	sewer_screen.process_mode = Node.PROCESS_MODE_DISABLED
	table_chair_screen.process_mode = Node.PROCESS_MODE_INHERIT
	table_chair_screen.visible = true
	downwards += 1
