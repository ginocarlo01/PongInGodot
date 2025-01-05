class_name Ball
extends RigidBody2D

signal leftWallSignal
signal rightWallSignal

@export var speed : int
@export var possibleDirections := []

var canCollide := true
var startPos 

var velocity : Vector2

func _ready() -> void:
	randomize()
	hide()
	

func start(pos):
	randomSpeed()
	position = pos
	startPos = position
	show()

func _on_up_wall_body_entered(body: Node2D) -> void:
	if canCollide:
		velocity.y *= -1
		velocity.normalized()
		linear_velocity = velocity


func _on_down_wall_body_entered(body: Node2D) -> void:
	if canCollide:
		velocity.y *= -1
		velocity.normalized()
		linear_velocity = velocity
		print(velocity)


func _on_left_wall_body_entered(body: Node2D) -> void:
	if canCollide:
		print("colidiu na esquerda")
		leftWallSignal.emit()
		linear_velocity = Vector2.ZERO
		position = startPos
		canCollide = false
		
	

func _on_right_wall_body_entered(body: Node2D) -> void:
	if canCollide:
		rightWallSignal.emit()
		linear_velocity = Vector2.ZERO
		position = startPos
		canCollide = false
		

func _on_player_body_entered(body: Node2D) -> void:
	velocity.x *= -1
	velocity.normalized()
	linear_velocity = velocity


func _on_machine_body_entered(body: Node2D) -> void:
	velocity.x *= -1
	velocity.normalized()
	linear_velocity = velocity
	
func randomSpeed():
	velocity = possibleDirections[randi() % possibleDirections.size()]
	velocity *= speed
	velocity.normalized()
	linear_velocity = velocity
	
	
