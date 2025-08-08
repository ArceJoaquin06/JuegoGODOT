extends Node2D

@onready var opciones = $Options
@onready var juego = $Jugar
@onready var menu_principal = $Menu

func _ready():
	juego.visible = false
	opciones.visible = false

func _on_play_pressed() -> void:
	menu_principal.visible = false
	juego.visible = true

func _on_opciones_button_up() -> void:
	opciones.visible = true
	opciones.pause_mode = 2 # ✅ "PROCESS"

func _on_exit_pressed() -> void:
	get_tree().quit()
