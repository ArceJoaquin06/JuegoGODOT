extends Node2D

func _input(event):
	if Input.is_action_just_pressed("Atack_Player"):
		$Player/Salud_1.recibir_daño(25)
