extends CharacterBody2D
class_name Arquero

@onready var caballero: Jugador = $"../Caballero"

var escalera = false
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var nodoSalud2
var esta_muerto = false

var esquivando = false
var tiempo_esquive = 0.3
var tiempo_restante_esquive = 0.0

var flecha = preload("res://flecha.tscn")

func _ready():
	nodoSalud2 = get_node("/root/Node2D/Arquero/Salud_2")
	
	caballero.connect('pegar', dañarme)

func _physics_process(delta: float) -> void:
	if esta_muerto:
		return
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if escalera:
		if Input.is_action_pressed("ui_up"):
			velocity.y = -50
		elif Input.is_action_pressed("ui_down"):
			velocity.y = 50

	var direction := Input.get_axis("ui_left", "ui_right")

	# Esquive
	if Input.is_action_just_pressed("Dodge_Arquero") and is_on_floor() and direction != 0 and !esquivando:
		esquivando = true
		tiempo_restante_esquive = tiempo_esquive
		velocity.x = direction * SPEED * 2
		$AnimatedSprite2D.play("Dodge")

	# Contador de esquive
	if esquivando:
		tiempo_restante_esquive -= delta
		if tiempo_restante_esquive <= 0:
			esquivando = false
	else:
		# Movimiento normal solo si no estás esquivando
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	animations(direction)

	move_and_slide()

	# Flip sprite
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
		
		
		
func animations(direction):
	if esta_muerto or esquivando:
		return
	
	if is_on_floor():
		if direction == 0:
			$AnimatedSprite2D.play("Idle")
		else:
			$AnimatedSprite2D.play("Run")
	
func morir():
	esta_muerto = true
	print("¡Me morí!")
	$AnimatedSprite2D.play("Death")
	
func _input(event):
	if event.is_action_pressed("Atack_Arquero"): #La L
		var newFlecha = flecha.instantiate()
		newFlecha.position = self.position
		newFlecha.isflip = $AnimatedSprite2D.flip_h 
		add_sibling(newFlecha)
		
func dañarme():
	print('me he dañao tío')
	nodoSalud2.recibir_daño(25)


func _on_animated_sprite_2d_animation_finished() -> void:
	if esta_muerto == true:
		print("Acabó")
		queue_free()
		get_tree().change_scene_to_file("res://game_over.tscn")
