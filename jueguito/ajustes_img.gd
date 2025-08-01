extends Node2D


func _on_ajustes_botón_pressed() -> void:
	get_tree().change_scene_to_file("res://options.tscn")
	get_tree().paused = true
