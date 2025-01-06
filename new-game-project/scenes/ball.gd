class_name Ball
extends CharacterBody2D

signal leftWallSignal
signal rightWallSignal

signal collided

@export var speed : int
var newSpeed : int
@export var accel : int = 25
@export var possibleDirections := []

@export var easySpeed : int
@export var normalSpeed : int
@export var hardSpeed : int

@export var pivotSprite : Node2D

const MAX_Y_VECTOR : float = 0.9

var startPos
var direction
var canStart : bool

func _ready() -> void:
	randomize()
	canStart = false
	pivotSprite.hide()
	
func start(pos):
	randomSpeed()
	if GameParams.level == 1:
		speed = easySpeed
	elif GameParams.level == 2:
		speed = normalSpeed
	elif GameParams.level == 3:
		speed = hardSpeed 
	newSpeed = speed
	position = pos
	startPos = pos
	canStart = true
	show()

func newBall():
	newSpeed = speed
	position = startPos
	randomSpeed()

func randomSpeed():
	if possibleDirections.size() == 0:
		assert(false, "No possible directions")
	direction = possibleDirections[randi() % possibleDirections.size()]
	
	direction.normalized()
	pivotSprite.rotation = Vector2(1,0).angle_to(direction)
	pivotSprite.show()

func _physics_process(delta: float) -> void:
	if !canStart:
		return
	var collision = move_and_collide(direction * newSpeed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider.is_in_group("Player") or collider.is_in_group("Machine"):
			collided.emit()
			newSpeed += accel
			direction = new_direction(collider)
		
		elif collider.is_in_group("Wall"):
			direction = direction.bounce(collision.get_normal())
			
		#pivotSprite.rotate(direction.x)
		pivotSprite.rotation = Vector2(1,0).angle_to(direction)


func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var newDir := Vector2()
	
	if direction.x > 0 and !(dist > collider.object_size.y / 2):
		newDir.x = -1
	else:
		newDir.x = 1
		
	newDir.y = (dist / (collider.object_size.y / 2)) * MAX_Y_VECTOR * 1.2
	
	return newDir.normalized()


func _on_warner_left_body_entered(body: Node2D) -> void:
	leftWallSignal.emit()
	pivotSprite.hide()

func _on_warner_right_body_entered(body: Node2D) -> void:
	rightWallSignal.emit()
	pivotSprite.hide()
