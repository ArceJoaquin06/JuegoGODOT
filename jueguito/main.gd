extends Node2D

@onready var opciones = $Options

func _on_ajustes_botón_pressed():
	opciones.visible = true
	get_tree().paused = true
	opciones.pause_mode = Node.PAUSE_MODE_PROCESS
