extends Recogible


func _on_body_entered(body):
	if body.is_in_group("Jugador") :
		GLOBAL.gasolina += 10
	if GLOBAL.gasolina > 100 :
		GLOBAL.gasolina = 100
		print("ENTRO GASOLINa")
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
