extends CanvasLayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Controla el animatedSprite de la gasolina de la nave
	if GLOBAL.gasolina <= 5:
		$AnimatedSprite2Gas.play("ZERO")
	elif GLOBAL.gasolina <= 33:
		$AnimatedSprite2Gas.play("UNO_GAS")
	elif GLOBAL.gasolina <= 66:
		$AnimatedSprite2Gas.play("DOS_GAS")
	else:
		$AnimatedSprite2Gas.play("FULL_GAS")
		
	#Controla el animatedSprite de los corazones
	if GLOBAL.lifes == 3:
		$AnimatedSprite2DCorazones.play("CorazonesLLenos")
	elif GLOBAL.lifes == 2:
		$AnimatedSprite2DCorazones.play("CorazonesDosVidas")
	elif GLOBAL.lifes == 1:
		$AnimatedSprite2DCorazones.play("CorazonesUnaVida")
	else:
		$AnimatedSprite2DCorazones.play("CorazonesVacios")
	
	#GUI SCORE
	$Label.text = "SCORE: " + str(GLOBAL.score)
