extends Area2D
 
@export var speedBullet : int = 300


func _ready():
	
	#To choose the color of the bullet
	
	var bullet_colors = ["bullet_red", "bullet_blue", "bullet_purple"]
	var random_index = randi() % bullet_colors.size()
	$AnimatedSprite2DBullet.play(bullet_colors[random_index])
	
	var notifier = $VisibleOnScreenNotifier2D
	notifier.connect("screen_exited", Callable(self, "_on_screen_exited"))


func _process(delta):
	
	position.y -= speedBullet * delta

func _on_screen_exited():
	queue_free()
