extends KinematicBody2D

onready var stats = $Stats
onready var sprite = $AnimatedSprite
var speed = 120
var friction = 0.01
var acceleration = 0.1
var velocity = Vector2()

var state = WALK

enum {
	WALK
	CHASE
	ATTACK
}

func _physics_process(delta):	
	match state:
		WALK:
			_move_to(Vector2(360,1113))
			if get_parent().minion != null:
				state = CHASE
			if position.y > 1113:
				queue_free()
		CHASE: 
			_move_to(get_parent().minion.global_position)
			sprite.flip_h = velocity.x < 0
			
			
		ATTACK:
			pass
			
			
func _attack():
	pass

 
func _move_to(pos):
	var direction = pos - global_position
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)
	

