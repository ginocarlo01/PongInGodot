class_name Player
extends StaticBody2D

@export var speed : int
var screen_size
var object_size
var direction

@export var player_n : int  #TODO: PUT DROP DOWN HERE
@export var look_of_player : CompressedTexture2D
@export var sprite : Sprite2D

@export var menu_up_height := 47

var canMove : bool

func _ready() -> void:	
	sprite.texture = look_of_player
	screen_size = get_viewport_rect().size
	object_size = $CollisionShape2D.shape.get_rect().size
	
	
func start(pos):
	position = pos
	canMove = true
	show()
	
func _process(delta: float) -> void:
	if !canMove: return
	direction = Vector2.ZERO
	if Input.is_action_pressed("move_down_p" + str(player_n)):
		direction.y += 1
	if Input.is_action_pressed("move_up_p" + str(player_n)):
		direction.y -= 1

	if direction.length() > 0:
		direction.normalized()
		
	position += direction * speed * delta
	position = position.clamp(Vector2.ZERO + Vector2(0, menu_up_height) + object_size/2, screen_size - object_size/2)
