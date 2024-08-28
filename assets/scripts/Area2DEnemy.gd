extends Area2D

var speedEnemy : int = randi_range(5,75)
var superPoderLaser : PackedScene = preload("res://scenes/super_poder_laser.tscn")

func _process(delta):
	position.y += delta * speedEnemy


func _on_area_entered(area):
	if area.name == "Bullet":
		var explosion_instance =  $"../Explosion" # Asegúrate de que Explosion ya esté instanciada
		
		#Place the coordinates in the correct position, but don't work at the 100%.
		explosion_instance.global_position = global_position
		
		var animation = explosion_instance.get_node("AnimatedExplosion")
		if randf() > 0.5 :
			print("Playing explosionOne")
			animation.play("explosionOne")
		else :
			print("Playing explosionTwo")
			animation.play("explosionTwo")
		explosion_instance.get_node("AudioStreamPlayer").play()

		print("Coordenadas de la bala(Get_GLOBAL) -> " + str(area.get_global_position()))
		print("Coordenadas de la bala -> " + str(area.position))
		print( "Coordenadas de la explosion(Get_GLOBAL) -> " +str(explosion_instance.get_global_position()))
		print( "Coordenadas de la explosion -> " +str(explosion_instance.position))
		
		#Generate a instance of a super power laser.
		#GLOBAL.random(1,10)
		if GLOBAL.random(1,10)==5:
			var instance_superPoder = superPoderLaser.instantiate()
			instance_superPoder.position = global_position
			get_tree().root.add_child(instance_superPoder)
			instance_superPoder.connect("add_power", Callable(GLOBAL.reference_ship, "poderRecogido"))

		area.queue_free()
		queue_free()
		GLOBAL.score += 10




func _on_body_entered(body):
	
	if body.is_in_group("Jugador") :
		match GLOBAL.lifes:
			3:
				GLOBAL.lifes = 2
			2:
				GLOBAL.lifes = 1
			1:
				GLOBAL.lifes = 0 
	
	var explosion_instance =  $"../Explosion"
	explosion_instance.global_position = Vector2(get_global_position())
	var animation = explosion_instance.get_node("AnimatedExplosion")
	
	if randf() > 0.5 :

		animation.play("explosionOne")
	else :

		animation.play("explosionTwo")
	explosion_instance.get_node("AudioStreamPlayer").play()
	queue_free()



func _on_visible_on_screen_notifier_2d_screen_exited():
	GLOBAL.lifes -=1
	
