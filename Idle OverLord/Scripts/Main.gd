extends Node2D

onready var EnemyScene = load("res://Scenes/Enemy.tscn")
onready var MinionScene = load("res://Scenes/Minions.tscn")

var enemy = null
var minion = null
var count = 0

func _ready():
	randomize()

func _on_MinionSpawnTimer_timeout():
	var xLoc = rand_range(78, 606)
	var yLoc = rand_range(154, 1088)
	var Minion = MinionScene.instance()
	self.add_child(Minion)
	Minion.global_position = Vector2(xLoc, yLoc)

func _on_EnemySpawnTimer_timeout():
	var Enemy = EnemyScene.instance()
	self.add_child(Enemy)
	Enemy.global_position = Vector2(360, 9)

func _on_Enemy_Detection_Zone_body_entered(body):
	minion = body

func _on_Minion_Detection_Zone_body_entered(body):
	enemy = body
