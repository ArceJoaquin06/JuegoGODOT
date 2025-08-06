extends Node2D

@onready var musica = $AudioStreamPlayer

@onready var tab_container = $Options/TabContainer

func _ready():
	musica.play()
	pass
