extends Label

func _physics_process(delta):
	text = "fps: " + str(Engine.get_frames_per_second())

