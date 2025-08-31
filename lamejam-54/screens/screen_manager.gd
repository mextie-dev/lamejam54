extends Node2D

@onready var inventory_text_knife: Node2D = $InventoryTextKnife
@onready var inventory_text_goat_head: Node2D = $InventoryTextGoatHead

@onready var cursor: Node2D = $Cursor


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
@onready var plane_cutscene_screen: Node2D = $PlaneCutsceneScreen
@onready var mountain_path_screen: Node2D = $MountainPathScreen
@onready var mountain_screen: Node2D = $MountainScreen
@onready var satan_statue_screen: Node2D = $SatanStatueScreen
@onready var ladder_hole_screen: Node2D = $LadderHoleScreen
@onready var hell_screen: Node2D = $HellScreen
@onready var ending_1_screen: Node2D = $Ending1Screen
@onready var ending_2_screen: Node2D = $Ending2Screen
@onready var bush_screen: Node2D = $BushScreen

var run := false

var hasKnife := false
var hasHead := false
var hasCrucifix := false

var satanOffered := false

var upwards := 0
var downwards := 0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
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
	plane_cutscene_screen.process_mode = Node.PROCESS_MODE_DISABLED
	mountain_path_screen.process_mode = Node.PROCESS_MODE_DISABLED
	mountain_screen.process_mode = Node.PROCESS_MODE_DISABLED
	satan_statue_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ladder_hole_screen.process_mode = Node.PROCESS_MODE_DISABLED
	hell_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ending_1_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ending_2_screen.process_mode = Node.PROCESS_MODE_DISABLED
	bush_screen.process_mode = Node.PROCESS_MODE_DISABLED
	
	
	pass

func _process(delta: float) -> void:
	
	if hasKnife:
		print("hasKnife")
		inventory_text_knife.visible = true
	pass
	
	
	
	# move cursor
	var mouse_position = get_viewport().get_mouse_position()
	cursor.position = mouse_position



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


func _on_plane_cutscene_screen_exit_cutscene() -> void:
	$MountainPathScreen/AnimationPlayer.play("fadeIn")
	plane_cutscene_screen.visible = false
	plane_cutscene_screen.process_mode = Node.PROCESS_MODE_DISABLED
	mountain_path_screen.process_mode = Node.PROCESS_MODE_INHERIT
	mountain_path_screen.visible = true
	plane_cutscene_screen.exitingArea = 1


func _on_airport_screen_plane_route() -> void:
	$PlaneCutsceneScreen/AnimationPlayer.play("fadeIn")
	plane_cutscene_screen.exitingArea = 0
	airport_screen.visible = false
	airport_screen.process_mode = Node.PROCESS_MODE_DISABLED
	plane_cutscene_screen.process_mode = Node.PROCESS_MODE_INHERIT
	plane_cutscene_screen.visible = true


func _on_mountain_screen_ladder_exit() -> void:
	$MountainPathScreen/AnimationPlayer.play("fadeIn")
	mountain_screen.visible = false
	mountain_screen.process_mode = Node.PROCESS_MODE_DISABLED
	mountain_path_screen.process_mode = Node.PROCESS_MODE_INHERIT
	mountain_path_screen.visible = true


func _on_mountain_screen_pressed_goat() -> void:
	if hasKnife:
		$MountainScreen/Stuff/Goat/AnimatedSprite2D.frame = 1
		hasKnife = false
		inventory_text_knife.hide()
		hasHead = true
		inventory_text_goat_head.show()
	else:
		pass # TODO make goat baa my name is ralsei im a baa


func _on_mountain_path_screen_rope_route() -> void:
	$MountainScreen/AnimationPlayer.play("fadeIn")
	mountain_path_screen.visible = false
	mountain_path_screen.process_mode = Node.PROCESS_MODE_DISABLED
	mountain_screen.process_mode = Node.PROCESS_MODE_INHERIT
	mountain_screen.visible = true


func _on_mountain_path_screen_planeexit_route() -> void:
	$PlaneCutsceneScreen/AnimationPlayer.play("flyPlane")
	mountain_path_screen.visible = false
	mountain_path_screen.process_mode = Node.PROCESS_MODE_DISABLED
	plane_cutscene_screen.process_mode = Node.PROCESS_MODE_INHERIT
	plane_cutscene_screen.visible = true
	plane_cutscene_screen.exitingArea = 1
	


func _on_plane_cutscene_screen_exit_cutscene_from_mountain() -> void:
	$AirportScreen/AnimationPlayer.play("fadeIn")
	plane_cutscene_screen.visible = false
	plane_cutscene_screen.process_mode = Node.PROCESS_MODE_DISABLED
	airport_screen.process_mode = Node.PROCESS_MODE_INHERIT
	airport_screen.visible = true
	plane_cutscene_screen.exitingArea = 0


func _on_sewer_screen_lockeddoor_route() -> void:
	$SatanStatueScreen/AnimationPlayer.play("fadeIn")
	sewer_screen.visible = false
	sewer_screen.process_mode = Node.PROCESS_MODE_DISABLED
	satan_statue_screen.process_mode = Node.PROCESS_MODE_INHERIT
	satan_statue_screen.visible = true


func _on_satan_statue_screen_vent_exit_route() -> void:
	$SewerScreen/AnimationPlayer.play("fadeIn")
	satan_statue_screen.visible = false
	satan_statue_screen.process_mode = Node.PROCESS_MODE_DISABLED
	sewer_screen.process_mode = Node.PROCESS_MODE_INHERIT
	sewer_screen.visible = true




func _on_satan_statue_screen_hell_door_route() -> void:
	$LadderHoleScreen/AnimationPlayer.play("fadeIn")
	satan_statue_screen.visible = false
	satan_statue_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ladder_hole_screen.process_mode = Node.PROCESS_MODE_INHERIT
	ladder_hole_screen.visible = true


func _on_satan_statue_screen_satan_offered() -> void:
	if hasHead:
		$SatanStatueScreen/Stuff/SatanStatue/SatanWithHead.hide()
		$SatanStatueScreen/Stuff/SatanStatue/SatanNoHead.show()
		$SatanStatueScreen/Stuff/SatanStatue/GoatHead.show()
		$SatanStatueScreen/Stuff/HellDoor.show()
		inventory_text_goat_head.hide()
		hasHead = false
	else:
		pass # baa


func _on_ladder_hole_screen_ladderhole_route() -> void:
	$HellScreen/AnimationPlayer.play("endCutscene")
	ladder_hole_screen.visible = false
	ladder_hole_screen.process_mode = Node.PROCESS_MODE_DISABLED
	hell_screen.process_mode = Node.PROCESS_MODE_INHERIT
	hell_screen.visible = true


func _on_hell_screen_tried_secret_ending() -> void:
	if hasCrucifix:
		$HellScreen/AnimationPlayer.stop()
		$HellScreen/AnimationPlayer.play("secret_ending")
		$HellScreen/Stuff/Background/AnimatedSprite2D.stop()
		await get_tree().create_timer(10).timeout

		$Ending2Screen/AnimationPlayer.play("endCredits")
		hell_screen.visible = false
		hell_screen.process_mode = Node.PROCESS_MODE_DISABLED
		ending_2_screen.process_mode = Node.PROCESS_MODE_INHERIT
		ending_2_screen.visible = true
	else:
		pass # play subtle sound



func _on_hell_screen_end_game() -> void:
	$Ending1Screen/AnimationPlayer.play("endCredits")
	hell_screen.visible = false
	hell_screen.process_mode = Node.PROCESS_MODE_DISABLED
	ending_1_screen.process_mode = Node.PROCESS_MODE_INHERIT
	ending_1_screen.visible = true


func _on_bush_screen_bushexit_route() -> void:
	$MountainPathScreen/AnimationPlayer.play("fadeIn")
	bush_screen.visible = false
	bush_screen.process_mode = Node.PROCESS_MODE_DISABLED
	mountain_path_screen.process_mode = Node.PROCESS_MODE_INHERIT
	mountain_path_screen.visible = true


func _on_bush_screen_got_cross() -> void:
	hasCrucifix = true


func _on_mountain_path_screen_bush_route() -> void:
	$BushScreen/AnimationPlayer.play("fadeIn")
	mountain_path_screen.visible = false
	mountain_path_screen.process_mode = Node.PROCESS_MODE_DISABLED
	bush_screen.process_mode = Node.PROCESS_MODE_INHERIT
	bush_screen.visible = true
