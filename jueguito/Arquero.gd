extends AnimatedSprite2D

const SPEED_A = 70
var velocity = Vector2.ZERO

func _ready():
	velocity.x = -SPEED_A
	play("Idle")

func _process(delta):
	velocity.x = -SPEED_A
