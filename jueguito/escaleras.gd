extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if 'escalera' in body:
		body.escalera = true


func _on_body_exited(body: Node2D) -> void:
	if 'escalera' in body:
		body.escalera = false
