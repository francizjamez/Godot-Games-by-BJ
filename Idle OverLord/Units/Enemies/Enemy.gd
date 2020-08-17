extends KinematicBody2D

onready var stats = $Stats
onready var sprite = $AnimatedSprite
var speed = 120
var friction = 0.01
var acceleration = 0.1
var velocity = Vector2()

var state = WALK

var target = null
var attacking = false

enum {
	WALK
	CHASE
	ATTACK
}

func _ready():
	add_to_group("enemies")

func _physics_process(delta):	
	match state:
		WALK:
			_move_to(Vector2(360,1113))
			if target != null:
				state = CHASE
			if position.y > 1113:
				queue_free()
		CHASE: 
			_move_to(target.global_position)
			if global_position.distance_to(target.global_position) < 36:
				state = ATTACK
				#set animation attack
		ATTACK:
			attacking = true
			
func _set_target(enemy):
	target = enemy
	state = CHASE
			
func _attack():
	pass

func _move_to(pos):
	var direction = pos - global_position
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)
	
	

