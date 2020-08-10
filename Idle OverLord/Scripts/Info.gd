tool
extends Node

class_name Info

onready var stats = $MinionStats

export var statistics : Resource

func _ready():
	stats.initialize(statistics)
