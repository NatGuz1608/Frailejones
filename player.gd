extends Area2D

@export var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
var screen_size: Vector2

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
	position.x = clamp(position.x, 0.0, screen_size.x)
	position.y = clamp(position.y, 0.0, screen_size.y)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("obstacle"):
		body.queue_free()
