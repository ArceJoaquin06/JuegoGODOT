extends Control


@onready var brillo = get_node("$TabContainer/Pantalla/MarginContainer/GridContainer/HBoxContainer/HSlider")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
