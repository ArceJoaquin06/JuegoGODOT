extends Node

signal brillo_cambiado(value)

func cambiar_brillo(value):
	emit_signal("brillo_cambiado", value)
