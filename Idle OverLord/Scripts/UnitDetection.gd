extends Area2D

var unit = null

func _physics_process(delta):
	pass

func can_see_unit():
	return unit != null

func _on_UnitDetectionZone_body_entered(body):
	unit = body

func _on_UnitDetectionZone_body_exited(body):
	body = null


