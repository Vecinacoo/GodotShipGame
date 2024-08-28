extends Node


@export var shot : PackedScene = preload("res://scenes/bullet.tscn")
@export var enemy : PackedScene = preload("res://scenes/enemy.tscn")
var canShoot : bool
var screenSize : Vector2 = Vector2(564,1002)
var juegoPausado : bool = false



func _ready():
	new_game()
	


func new_game():
	$Ship.position = GLOBAL.START_POSITION
	GLOBAL.reference_ship = $Ship
	GLOBAL.score = 0
	GLOBAL.lifes = 3
	GLOBAL.gasolina = 100
	canShoot = true

	$TimerForSpawnEnemy.start(1)
	juegoPausado = false
	
	
func _process(delta):
	
	#Control of the player
	if !juegoPausado:
		anim_crt(delta)
		
		if Input.is_action_pressed("disparar"):
			shoot_crtl()
	
		
	if GLOBAL.lifes == 0 or GLOBAL.gasolina <= 0:
		juegoPausado = true
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func anim_crt(delta):
	
	if Input.is_action_pressed("move_up") and Input.is_action_pressed("move_left") :  
		$Ship.position.y -= GLOBAL.velocity_ship 
		$Ship.position.x -= GLOBAL.velocity_ship
	
	elif Input.is_action_pressed("move_up") and Input.is_action_pressed("move_right"):
		$Ship.position.y -= GLOBAL.velocity_ship 
		$Ship.position.x += GLOBAL.velocity_ship 
	elif Input.is_action_pressed("move_down") and Input.is_action_pressed("move_left"):
		$Ship.position.y += GLOBAL.velocity_ship
		$Ship.position.x -= GLOBAL.velocity_ship 
	elif Input.is_action_pressed("move_down") and Input.is_action_pressed("move_right"):
		$Ship.position.y += GLOBAL.velocity_ship
		$Ship.position.x += GLOBAL.velocity_ship 
	elif Input.is_action_pressed("move_up"): 

		$Ship.position.y -= GLOBAL.velocity_ship 
	elif Input.is_action_pressed("move_down"): 

		$Ship.position.y += GLOBAL.velocity_ship
	elif Input.is_action_pressed("move_left"): 

		$Ship.position.x -= GLOBAL.velocity_ship
	elif Input.is_action_pressed("move_right"): 
		$Ship.position.x += GLOBAL.velocity_ship 
		
#Detectar turbo(Shift), animacion la controla el script de la nave
	if Input.is_action_pressed("Turbo"):
		$Ship.activarTurbo()
		$Ship.turboActivado = true
	else:
		$Ship.turboActivado = false
		GLOBAL.velocity_ship = 1

	# Mantence the ship in the screen Leedeo Studio
	$Ship.position.x = clamp($Ship.position.x,0,screenSize.x)
	$Ship.position.y = clamp($Ship.position.y,0,896)
	GLOBAL.gasolina -= 0.005
	print(GLOBAL.gasolina)

func shoot_crtl():
	if canShoot:
		canShoot = false
		var instance_bullet = shot.instantiate()

		add_child(instance_bullet)
		instance_bullet.position = $Ship.find_child("MarkerForFlash").get_global_position()
		GLOBAL.gasolina -= 1

func _on_timer_for_shoot_timeout():
	canShoot = true


func _on_timer_for_spawn_enemy_timeout():
	var instance_enemy = enemy.instantiate()

	instance_enemy.position = Vector2(randi_range(10,570),0)
	add_child(instance_enemy)
	print("SPAWN")
	$TimerForSpawnEnemy.start(randi_range(3,5))



