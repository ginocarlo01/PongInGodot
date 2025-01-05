class_name Player
extends Area2D

@export var speed : int
var screen_size
var player_size
var velocity

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
	player_size = $CollisionShape2D.shape.get_rect().size
	hide()
	
func start(pos):
	position = pos
	show()
	
func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity.normalized()
		
	position += velocity * speed * delta
	position = position.clamp(Vector2.ZERO + Vector2(0, 47) + player_size/2, screen_size - player_size/2)
