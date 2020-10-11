extends Sprite

onready var tw = get_node("Tween_move")
onready var collider = get_parent().get_node("CollisionShape2D")
onready var area = get_parent().get_node("Area2D")
var bodies = Array()
var state = "closed"

func _ready():
	area.connect("body_entered", self, "body_entered")
	area.connect("body_exited", self, "body_exited")
	set_physics_process(false)
	

func _physics_process(delta): 
	var target_pos
	
	if Input.is_action_just_pressed("ui_interact"):
		if state == "closed" and tw.is_active() == false:
			target_pos = 35
			move_door(target_pos)
			state = "opened"
		elif state == "opened" and tw.is_active() == false:
			target_pos = 0
			move_door(target_pos)
			state = "closed"
			
func move_door(target_pos):
	tw.interpolate_property(self, "position", position, Vector2(target_pos, 14), 1, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tw.interpolate_property(collider, "position", collider.position, Vector2(target_pos, 32), 1, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tw.start()
		
func body_entered(body):
	bodies.append(body)
	set_physics_process(true)

func body_exited(body):
	for i in range(0, bodies.size()):
		if bodies[i] == body:
			bodies.remove(i)
	set_physics_process(false)
	
