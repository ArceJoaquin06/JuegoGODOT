extends Control



func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Jugar.tscn")


func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
