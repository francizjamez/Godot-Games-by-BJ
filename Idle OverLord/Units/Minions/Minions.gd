extends KinematicBody2D

onready var stats = $Stats
onready var sprite = $AnimatedSprite
var speed = 120
var friction = 0.01
var acceleration = 0.1
var velocity = Vector2()

var state = IDLE

var targets_limit = 2
var targets = []
var sorted_targets = null


func _ready():
	add_to_group("minions")

enum {
	IDLE
	CHASE
	ATTACK
}

func _physics_process(delta):	
	match state:
		IDLE:
			_search_enemies()
			
		CHASE: 
			_search_enemies()
			
#			_move_to(get_parent().enemy.global_position)
#			sprite.flip_h = velocity.x < 0

#			if get_parent().enemy.global_position.distance_to(global_position) < 36:
#				state = ATTACK
#				sprite.set_animation("Attack")
		ATTACK:
			pass
			
func _search_enemies():
		if targets.size() != targets_limit:
			var enemies = get_tree().get_nodes_in_group("enemies")
			var enemy_count = enemies.size()
			
			if enemy_count != 0:
				_sort_distance(enemies) 
				_get_available(sorted_targets)
				
				for i in range(sorted_targets.size()):
					if targets.size() < targets_limit:
						targets.append(sorted_targets[i])
						_taunt_enemy(sorted_targets[i])
					if targets.size() == targets_limit:
						break
						
			state = CHASE

func _sort_distance(array):
	var sorted = array
	var temp = null
	
	for i in range(1, sorted.size()):
		var key = sorted[i]
		var j = i - 1
		
		while j >= 0 and sorted[j].global_position.distance_to(global_position) > key.global_position.distance_to(global_position):
				sorted[j + 1] = sorted[j]
				j = j - 1
				
		sorted[j + 1] = key
	sorted_targets = sorted
	
func _get_available(array):
	var sorted  = []
	for unit in array:
		if unit.state == 0:
			sorted.append(unit)
	sorted_targets = sorted

func _taunt_enemy(enemy):
	enemy._set_target(self)
			
func _move_to(pos):
	var direction = pos - global_position
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)

