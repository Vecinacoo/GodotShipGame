extends Recogible



func _on_body_entered(body):
	if body.is_in_group("Jugador") :
		if not GLOBAL.lifes == 3 :
			GLOBAL.lifes +=1 
			queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("SALIO CORAZON")
	queue_free()
