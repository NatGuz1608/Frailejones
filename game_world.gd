extends Node2D

@onready var timer: Timer = $Timer               
@onready var maintimer: Timer = $maintimer       
@onready var retrytimer: Timer = $retrytimer     
@onready var time_label: Label = $HUD/timelabel
@onready var message_label: Label = $HUD/messagelabel

var time_left := 180  # 3 minutos
var _retry_count := 3

var obstacle_scene: PackedScene = preload("res://falling.tscn")

func _ready() -> void:
	# Timer de generación
	timer.timeout.connect(_on_Timer_timeout)
	timer.start(randf_range(0.3, 1.0))

	# Timer del cronómetro
	maintimer.timeout.connect(_on_main_timer_timeout)
	maintimer.start(1.0)

	# Timer de reinicio
	retrytimer.timeout.connect(_on_retry_timer_timeout)

	# HUD
	time_label.text = format_time(time_left)
	message_label.text = ""


# ---------------------------------------------------------
# SPAWN DE OBJETOS
# ---------------------------------------------------------
func _on_Timer_timeout() -> void:
	var screen_size = get_viewport_rect().size
	var spawn_position = Vector2(randf_range(0.0, screen_size.x), -100.0)

	var obstacle_instance = obstacle_scene.instantiate()
	obstacle_instance.position = spawn_position
	add_child(obstacle_instance)

	timer.start(randf_range(0.3, 1.0))


# ---------------------------------------------------------
# CRONÓMETRO PRINCIPAL
# ---------------------------------------------------------
func _on_main_timer_timeout() -> void:
	time_left -= 1
	time_label.text = format_time(time_left)

	if time_left <= 0:
		game_over()

func format_time(t: int) -> String:
	var minutes = t / 60
	var seconds = t % 60
	return str(minutes) + ":" + str(seconds).pad_zeros(2)


# ---------------------------------------------------------
# FIN DEL TIEMPO
# ---------------------------------------------------------
func game_over() -> void:
	timer.stop()
	maintimer.stop()

	_retry_count = 3
	message_label.text = "Inténtalo de nuevo…  3"

	retrytimer.start(1.0)


# ---------------------------------------------------------
# CUENTA REGRESIVA 3…2…1 Y REINICIO
# ---------------------------------------------------------
func _on_retry_timer_timeout() -> void:
	_retry_count -= 1

	if _retry_count > 0:
		message_label.text = "Inténtalo de nuevo…  " + str(_retry_count)
	else:
		# Reiniciar la escena
		get_tree().reload_current_scene()
