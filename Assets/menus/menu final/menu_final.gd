extends Control
class_name Menufinal

func _on_reinicio_2_pressed() -> void:
	get_tree().change_scene_to_file("res://game_world.tscn")


func _on_inicio_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/menus/menu inicio/menu_inicio.tscn")
