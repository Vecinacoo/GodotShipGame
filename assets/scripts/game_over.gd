extends CanvasLayer





func _on_button_pressed():
	print("REINICIAR JUEGO")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
