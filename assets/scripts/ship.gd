extends CharacterBody2D

@export var explosion : PackedScene = preload("res://scenes/explosion.tscn")
@onready var poderActivado : bool = false
@onready var turboActivado : bool = false

func _process(delta):

	if GLOBAL.lifes == 3:

		$AnimatedSprite2D.play("fullhealth")
	elif GLOBAL.lifes == 2:

		$AnimatedSprite2D.play("damaged")
	elif GLOBAL.lifes == 1:
		$AnimatedSprite2D.play("full_damaged")
	elif GLOBAL.lifes == 0:
		var instancie_explosion = explosion.instantiate()
		instancie_explosion.global_position = position
		var animation = instancie_explosion.get_node("AnimatedExplosion")
		animation.play("explosionOne")
	queue_redraw()
	activarTurbo()


func poderRecogido():
	poderActivado = true
	$TimerForPowerLaser.start(10)


func _draw():
	if poderActivado:
		draw_line($MarkerForFlash.position, Vector2($MarkerForFlash.position.x, $MarkerForFlash.position.y-900), Color.RED,.5)

func activarTurbo():
	if turboActivado:
		var actualAnimation : String = ($AnimatedSprite2D.get("animation"))
		#Para que no de error, ja que si no busca luego el nombre_turbo+_turbo i no existe
		if actualAnimation.contains("_turbo") :
			actualAnimation = actualAnimation.replace("_turbo","")

		$AnimatedSprite2D.play(actualAnimation+"_turbo")
		GLOBAL.velocity_ship = 2
		GLOBAL.gasolina -= 0.010

func _on_timer_for_power_laser_timeout():
	poderActivado = false
