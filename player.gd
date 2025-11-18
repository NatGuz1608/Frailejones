extends Area2D

@export var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
var screen_size: Vector2
var move_area: Rect2 = Rect2(0, 0, 440, 854)

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	
	# Limita la posición al área definida
	position.x = clamp(position.x, move_area.position.x, move_area.end.x)
	position.y = clamp(position.y, move_area.position.y, move_area.end.y)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("obstacle"):
		body.queue_free()
