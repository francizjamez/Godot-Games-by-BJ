extends Door

onready var sprite = $Door

func _ready():
	area = $Area2D
	state = "closed"
	
	area.connect("body_entered", self, "body_entered")
	area.connect("body_exited", self, "body_exited")
	set_physics_process(false)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_interact"):
		if state == "closed":
			sprite.visible = false
			state = "opened"
		elif state == "opened":
			sprite.visible = true
			state = "closed"
