extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game over")
	await $MessageTimer.timeout
	
	$Message.text = "Dodge!"
	$Message.show()
	await get_tree().create_timer(1.0).timeout
	
	$StartButton.show()

func update_score(score):
	$Score.text = str(score)

func _on_message_timer_timeout():
	$Message.hide()
	
func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

