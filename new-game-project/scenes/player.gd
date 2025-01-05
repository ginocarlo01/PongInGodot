class_name Player
extends StaticBody2D

@export var speed : int
var screen_size
var object_size
var direction

var canMove : bool

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
	object_size = $CollisionShape2D.shape.get_rect().size
	hide()
	
func start(pos):
	position = pos
	canMove = true
	show()
	
func _process(delta: float) -> void:
	if !canMove: return
	direction = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1

	if direction.length() > 0:
		direction.normalized()
		
	position += direction * speed * delta
	position = position.clamp(Vector2.ZERO + Vector2(0, 47) + object_size/2, screen_size - object_size/2)
