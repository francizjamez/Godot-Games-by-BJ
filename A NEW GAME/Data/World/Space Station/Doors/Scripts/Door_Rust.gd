extends Door

onready var collider = $CollisionShape2D

func _ready():
	area = $Area2D	
	state = "closed"
	tw = $CollisionShape2D/Tween_move

	area.connect("body_entered", self, "body_entered")
	area.connect("body_exited", self, "body_exited")
	set_physics_process(false)

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_interact"):
		if state == "closed" and tw.is_active() == false:
			slide_door(collider, Vector2(collider.position.x+35,collider.position.y))
			state = "opened"
		elif state == "opened" and tw.is_active() == false:
			slide_door(collider, Vector2(collider.position.x-35,collider.position.y))
			state = "closed"
	
