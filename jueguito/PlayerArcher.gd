extends CharacterBody2D

const SPEED_A = 70

@onready var animationArcher=$AnimationPlayer
@onready var sprite2D=$Sprite2D

func _ready():
	velocity.x = -SPEED_A
	animationArcher.play("standing2")
	
func _fisico_proceso(delta):
	velocity.x = -SPEED_A

	move_and_slide()
