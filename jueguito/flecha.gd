extends Node2D

var velocidad = Vector2(250, -150)
var gravedad = 9.8

var isflip = false

func _ready():
	if isflip:
		velocidad.x *= -1

	$hitBox/CollisionShape2D.disabled = true
	$Timer.start()

func _process(delta):
	velocidad.y += gravedad
	position += velocidad * delta
	
#17.15

func _on_timer_timeout() -> void:
	$hitBox/CollisionShape2D.disabled = false

func _on_hit_box_body_entered(body) -> void:
	queue_free()
