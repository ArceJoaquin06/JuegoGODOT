extends Node2D

@onready var musica = $AudioStreamPlayer

func _ready():
	musica.play()
	pass
	
#func _input(event):
#	if Input.is_action_just_pressed("Atack_Player"):
#		$Player/Salud_1.recibir_daño(25)
#	elif Input.is_action_just_pressed("Atack_Arquero"):
#		$Arquero/Salud_2.recibir_daño(25)
