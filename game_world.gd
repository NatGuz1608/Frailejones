extends Node2D

@onready var timer: Timer = $Timer
var obstacle_scene: PackedScene = preload("res://falling.tscn")
var t: float = randf_range(0.3, 1.0)

func _ready() -> void:
	timer.timeout.connect(_on_Timer_timeout)
	timer.start(t)

func _on_Timer_timeout() -> void:
	var screen_size: Vector2 = get_viewport_rect().size
	var spawn_position: Vector2 = Vector2(randf_range(0.0, screen_size.x), -100.0)

	var obstacle_instance: Node2D = obstacle_scene.instantiate()
	obstacle_instance.position = spawn_position
	add_child(obstacle_instance)

	# Reinicia el Timer con un nuevo tiempo aleatorio
	timer.start(randf_range(0.3, 1.0))
