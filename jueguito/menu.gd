extends Control



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Jugar.tscn")


func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://options.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
