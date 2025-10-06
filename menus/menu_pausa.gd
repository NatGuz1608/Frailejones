extends Control
class_name pausaMenu



func _on_reanudar_pressed() -> void:
	get_tree().change_scene_to_file ("res://Escenas/Game.tscn")



func _on_reinicio_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene ()  
#poner escena del videojuego 

func _on_inicio_pressed() -> void:
	get_tree().change_scene_to_file ("res://menus/menu inicio/menu_inicio.tscn")
