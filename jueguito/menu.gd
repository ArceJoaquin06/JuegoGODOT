extends Control



func _on_play_pressed() -> void:
	$MenuPrincipal.visible = false
	$Juego.visible = true
	$UI.visible = true
	$Juego.iniciar_juego()


func _on_opciones_pressed() -> void:
	$Opciones.visible = true
	$Opciones.pause_mode = Node.PAUSE_MODE_PROCESS


func _on_exit_pressed() -> void:
	get_tree().quit()
