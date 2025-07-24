extends Node
class_name Salud1

@export var salud_actual := 100.0
@export var salud_maxima := 100.0
@export var barra_salud : BarraSalud

func recibir_daño(cantidad : float):
	salud_actual -= cantidad
	
	actualizar_salud()
	
	if salud_actual <= 0:
		$AnimatedSprite2D.Death() #Acá temgo que exportar la funcion Death

func actualizar_salud():
		if barra_salud:
			barra_salud.actualizar_barra(salud_maxima, salud_actual)
