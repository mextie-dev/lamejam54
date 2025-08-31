extends Node2D

@onready var number_1: AnimatedSprite2D = $Puzzle/Number1
@onready var number_2: AnimatedSprite2D = $Puzzle/Number2
@onready var number_3: AnimatedSprite2D = $Puzzle/Number3
@onready var puzzle: Node2D = $Puzzle
@onready var wrong: Node2D = $Wrong

signal right_code()

func _on_up_1_pressed() -> void:
	$Click.play()
	print(number_1.frame)
	number_1.frame += 1

func _on_up_2_pressed() -> void:
	$Click.play()
	print(number_2.frame)
	
	number_2.frame += 1

func _on_up_3_pressed() -> void:
	$Click.play()
	print(number_3.frame)
	
	number_3.frame += 1

func _on_down_1_pressed() -> void:
	$Click.play()
	print(number_1.frame)
	
	number_1.frame -= 1

func _on_down_2_pressed() -> void:
	$Click.play()
	print(number_2.frame)
	
	number_2.frame -= 1

func _on_down_3_pressed() -> void:
	$Click.play()
	print(number_3.frame)
	
	number_3.frame -= 1


func _on_check_button_pressed() -> void:
	$Click.play()
	if number_1.frame == 0 && number_2.frame == 3 && number_3.frame == 0:
		print("right code")
		right_code.emit()
	else:
		print("wrong")
		puzzle.visible = false
		wrong.visible = true
		await get_tree().create_timer(1).timeout
		self.hide()
		wrong.visible = false
		puzzle.visible = true
		
		
