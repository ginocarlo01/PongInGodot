class_name Machine
extends Area2D

@export var speed : int
@export var ball : Ball
@export var min_distance_to_ball := 10
var screen_size
var machine_size
var velocity

func _ready() -> void:
	screen_size = get_viewport_rect().size
	machine_size = $CollisionShape2D.shape.get_rect().size
	hide()
	
func start(pos):
	position = pos
	show()

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	var ballY = ball.position.y
	if ballY > position.y and abs(ballY - position.y) > min_distance_to_ball:
		velocity.y += 1
	elif ballY < position.y and abs(ballY - position.y) > min_distance_to_ball:
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity.normalized()
	
	position += velocity * speed * delta
	
	position = position.clamp(Vector2.ZERO + + Vector2(0, 47) + machine_size/2, screen_size - machine_size/2)
	
	
