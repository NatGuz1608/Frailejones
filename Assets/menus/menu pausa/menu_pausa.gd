extends Control
class_name pausaMenu

func _on_reanudar_pressed() -> void:
	get_tree().change_scene_to_file("res://game_world.tscn")
"	get_tree().paused = false
	self.visible = false  # Oculta el menú de pausa
"
func _on_reinicio_pressed() -> void:
	get_tree().change_scene_to_file("res://game_world.tscn")

func _on_inicio_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/menus/menu inicio/menu_inicio.tscn")
