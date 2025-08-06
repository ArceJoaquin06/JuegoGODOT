extends Control

@onready var brillo = get_node("$/root/Options/TabContainer/Pantalla/MarginContainer/GridContainer/HBoxContainer/HSlider")

func _on_button_pressed() -> void:
	get_tree().paused = false
	visible = false


func _on_brillo_slider_value_changed(value: float) -> void:
	ConfigGlobal.cambiar_brillo(value)
	

#46:48
