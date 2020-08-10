extends KinematicBody2D

onready var stats = $Stats
onready var sprite = $AnimatedSprite
var speed = 120
var friction = 0.01
var acceleration = 0.1
var velocity = Vector2()

var state = IDLE

enum {
	IDLE
	CHASE
}


func _physics_process(delta):	
	match state:
		IDLE:
			if get_parent().enemy != null:
				state = CHASE
		CHASE: 
			_move_to(get_parent().enemy.global_position)
			sprite.flip_h = velocity.x < 0
			
		 
func _move_to(pos):
	var direction = pos - global_position
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)

