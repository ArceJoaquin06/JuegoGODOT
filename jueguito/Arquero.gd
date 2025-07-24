extends CharacterBody2D

var escalera = false
const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var flecha = preload("res://flecha.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if escalera:
		if Input.is_action_pressed("ui_up"):
			velocity.y = -50
		elif Input.is_action_pressed("ui_down"):
			velocity.y = 50
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if Input.is_action_just_pressed("Dodge_Arquero") and is_on_floor() and direction != 0:
		velocity.x = direction * SPEED * 2
		$AnimatedSprite2D.play("Dodge")
	
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
	if is_on_floor():
		if direction==0:
			$AnimatedSprite2D.play("Idle")
		else:
			$AnimatedSprite2D.play("Run")
	

func _input(event):
	if event.is_action_pressed("Atack_Arquero"): #La L
		var newFlecha = flecha.instantiate()
		newFlecha.position = self.position
		newFlecha.isflip = $AnimatedSprite2D.flip_h 
		add_sibling(newFlecha)
