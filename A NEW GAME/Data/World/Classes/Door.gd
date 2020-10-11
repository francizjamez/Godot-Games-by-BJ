extends StaticBody2D

class_name Door

var tw
var area

var bodies = Array()
var state

func slide_door(mover, towards):
	tw.interpolate_property(mover, "position", mover.position , towards, 1, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tw.start()

func body_entered(body):
	bodies.append(body)
	set_physics_process(true)

func body_exited(body):
	for i in range(0, bodies.size()):
		if bodies[i] == body:
			bodies.remove(i)
	if bodies.size()==0:
		set_physics_process(false)


	
