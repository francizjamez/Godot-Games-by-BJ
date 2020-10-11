extends StaticBody2D

onready var sprite = $Cubicle_Door/Cubile_Door_Washroom
onready var collider = $Cubicle_Door/CollisionShape2D
onready var bodies  = Array()

func _ready():
	$Cubicle_Door/Area2D.connect("body_entered", self, "body_entered")
	$Cubicle_Door/Area2D.connect("body_exited", self, "body_exited")
	set_process(false)

func _process(delta):
	if Input.is_action_just_pressed("ui_interact"):
		if sprite.visible == true:
			sprite.visible = false
			collider.disabled = true
		else:
			sprite.visible = true
			collider.disabled = false	

func body_entered(body):
	set_process(true)
	bodies.append(body)
	
func body_exited(body):
	for i in range(0, bodies.size()):
		if bodies[i] == body:
			bodies.remove(i)
	set_process(false)
