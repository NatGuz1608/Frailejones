extends CharacterBody2D

const SPEED = 200.0
const GRAVITY = 980.0  # Valor de gravedad definido manualmente
const FLIP_INTERVAL = 1.0  # Intervalo de tiempo para girar el sprite (en segundos)

var left_bound = 100.0  # Límite izquierdo
var right_bound = 500.0  # Límite derecho
var moving_right = true  # Dirección inicial
var time_elapsed = 0.0  # Tiempo transcurrido

func _physics_process(delta: float) -> void:
	# Aplicar gravedad si no está en el suelo
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Mover al enemigo
	if moving_right:
		velocity.x = SPEED
		if position.x >= right_bound:
			moving_right = false
	else:
		velocity.x = -SPEED
		if position.x <= left_bound:
			moving_right = true

	# Incrementar el tiempo transcurrido
	time_elapsed += delta

	# Girar el sprite cada cierto tiempo
	if time_elapsed >= FLIP_INTERVAL:
		# Cambiar la dirección del sprite
		scale.x = -scale.x
		time_elapsed = 0.0

	move_and_slide()
