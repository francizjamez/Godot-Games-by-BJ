extends YSort

var unit = null

func _physics_process(delta):
	pass

func can_see_unit():
	return unit != null

func _on_MinionDetectionZone_body_entered(body):
	unit = body
