extends Node
class_name Salud1

@export var salud_actual := 100.0
@export var salud_maxima := 100.0
@export var barra_salud : BarraSalud
@export var personaje: CharacterBody2D

func recibir_daño(cantidad : float):
	salud_actual -= cantidad
	
	actualizar_salud()
	
	if salud_actual <= 0:
		print('personaje muerto')
		personaje.morir()
		#if personaje.has_method("morir"):
		#	print('me mori')
		#	personaje.call("morir")

func actualizar_salud():
		if barra_salud:
			barra_salud.actualizar_barra(salud_maxima, salud_actual)
