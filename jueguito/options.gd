extends Control


@onready var brillo = get_node("$TabContainer/Pantalla/MarginContainer/GridContainer/HBoxContainer/HSlider")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_brillo_slider_value_changed(value: float) -> void:
	ConfigGlobal.cambiar_brillo(value)
	

#46:48
