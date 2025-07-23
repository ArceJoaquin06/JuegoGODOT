extends Node2D

var velocidad = Vector2(250, -150)
var gravedad = 9.8

var isflip = false

func _ready():
	if isflip:
		velocidad.x *= -1

func _process(delta):
	velocidad.y += gravedad
	position += velocidad * delta
	


func _on_hit_box_body_entered(body: Node2D) -> void: #NECESITA TEMPORIZADOR
	self.queue_free()
