extends Recogible

signal add_power

func _on_body_entered(body):
	if body.is_in_group("Jugador"):
		print("ENTRO EL JUGADOR AL SUPER PODER")
		emit_signal("add_power")
		queue_free()




func _on_visible_on_screen_notifier_2d_screen_exited():
	print("SALIO")
	queue_free()
