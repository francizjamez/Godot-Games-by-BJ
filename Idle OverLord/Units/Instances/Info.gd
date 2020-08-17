tool
extends Node

class_name Info

onready var stats = $Stats

export var statistics : Resource

func _ready():
	stats.initialize(statistics)
