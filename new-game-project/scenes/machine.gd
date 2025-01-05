class_name Machine
extends StaticBody2D

@export var speed : int
@export var ball : Ball
@export var min_distance_to_ball := 10
var screen_size
var object_size
var direction : int
var canMove : bool

func _ready() -> void:
	screen_size = get_viewport_rect().size
	object_size = $CollisionShape2D.shape.get_rect().size
	hide()
	
func start(pos):
	position = pos
	canMove = true
	show()

func _physics_process(delta: float) -> void:
	if !ball:
		assert(false, "Bola não selecionada para a machine")
	
	if !canMove: return 
		
	var ballY = ball.position.y
	var machineY = position.y
	var dist = machineY - ballY
	var moveBy
	direction = 0
	
	if ballY > machineY:
		direction -= 1
	elif ballY < machineY:
		direction += 1
		
	if abs(dist) > speed * delta:
		moveBy = direction * speed * delta
	else:
		moveBy = dist
	
	
	position.y -= moveBy
	
	position = position.clamp(Vector2.ZERO + Vector2(0, 47) + object_size/2, screen_size - object_size/2)
	
