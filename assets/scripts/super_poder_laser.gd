extends Area2D

signal add_power


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 1


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Se borro el super poder por salir de la pantalla")
	queue_free()

func _on_body_entered(body):
	if body.is_in_group("Jugador"):
		print("ENTRO EL JUGADOR AL SUPER PODER")
		emit_signal("add_power")
		queue_free()


