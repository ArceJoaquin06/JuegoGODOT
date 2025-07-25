extends CharacterBody2D
class_name Jugador

var escalera = false
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
 
var nodoSalud
var esta_muerto = false

func _ready():
	nodoSalud = get_node("/root/Node2D/Caballero/Salud_1") as Salud1

func _physics_process(delta: float) -> void:
	if esta_muerto:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Arriba_Player") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if escalera:
		if Input.is_action_pressed("Arriba_Player"):
			velocity.y = -50
		elif Input.is_action_pressed("Abajo_Player"):
			velocity.y = 50

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Izq_Player", "Der_Player")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	animations(direction)

	if direction ==1:
		$AnimatedSprite2D.flip_h =false
	elif direction == -1:
		$AnimatedSprite2D.flip_h =true
		
func animations(direction):
	if esta_muerto:
		return
		
	if is_on_floor():
		if direction==0:
			$AnimatedSprite2D.play("Idle")
		else:
			$AnimatedSprite2D.play("Run")
			
func morir():
	esta_muerto = true
	print("¡Me morí!")
	$AnimatedSprite2D.play("Death")
	
func _on_animated_sprite_2d_animation_finished() -> void:
	print("Animación terminada")
	self.queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("flecha"):
		print("Tengo una serpiente en mi bota")
		nodoSalud.recibir_daño(25)
