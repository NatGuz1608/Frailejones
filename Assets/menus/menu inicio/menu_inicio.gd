extends Control
class_name MainMenu

"func _ready() -> void:
	get_tree().paused = true"



func _on_jugar_pressed() -> void:

	get_tree().change_scene_to_file("res://game_world.tscn")


func _on_seleccion_pressed() -> void:

	get_tree().change_scene_to_file( "nombre de scena a cambiar")


func _on_salir_pressed() -> void:

	get_tree().quit()
