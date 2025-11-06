
extends Node2D

var speed: float = 300.0  # Velocidad de caída en píxeles/segundo

func _process(delta: float) -> void:
	position.y += speed * delta

	# Si sale de la pantalla, elimínala
	if position.y > get_viewport_rect().size.y:
		queue_free()
