extends Node

var score : int = 0
const START_POSITION : Vector2 = Vector2(293,862)
var axis : Vector2
var reference_ship = null
var gasolina : float = 100
@onready var lifes : int = 3
@onready var velocity_ship : int = 1

@onready var rng : RandomNumberGenerator = RandomNumberGenerator.new()

#Funcion para retornar la direccion pulsada.
func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()


func random(min_number: int,max_number:int):
	rng.randomize()
	var random: int = int(rng.randi_range(min_number,max_number))
	return random
