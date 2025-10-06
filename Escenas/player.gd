extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0  # <--- ADDED: Define gravity value (standard Godot default is often around 980)
var attack: bool = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pausa"):
		get_tree().paused = true
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and not attack:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and not attack:
		velocity.x = direction * SPEED
		if is_on_floor():
			$AnimatedSprite2D.play("Caminata")
		# Flip sprite based on direction
		if direction > 0:
			$AnimatedSprite2D.scale.x = 1
		elif direction < 0:
			$AnimatedSprite2D.scale.x = -1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor() and not attack:
			$AnimatedSprite2D.play("Idle")

	# Handle attack input.
	if Input.is_action_just_pressed("ui_attack") and not attack:
		attack = true
		$AnimatedSprite2D.play("Ataque")

	move_and_slide()

# Función para manejar la finalización de la animación de ataque
func _on_AnimatedSprite2D_animation_finished(anim_name: String) -> void:
	# FIX: Animation name should be "Ataque" to match the play call, not "attack"
	if anim_name == "Ataque": 
		attack = false
