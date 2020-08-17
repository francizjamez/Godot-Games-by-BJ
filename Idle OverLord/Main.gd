extends Node2D

onready var EnemyScene = load("res://Units/Enemies/Enemy.tscn")
onready var MinionScene = load("res://Units/Minions/Minions.tscn")

var count = 0

func _ready():
	randomize()
	
func _process(delta):
#	if Engine.get_frames_per_second() < 25:
	print("FPS: " + str(Engine.get_frames_per_second()) + " - Spawns: " + str(count))

func _on_MinionSpawnTimer_timeout():
	var xLoc = rand_range(78, 606)
	var yLoc = rand_range(154, 1088)
	var Minion = MinionScene.instance()
	self.add_child(Minion)
	count += 1
	Minion.global_position = Vector2(xLoc, yLoc)

func _on_EnemySpawnTimer_timeout():
	var Enemy = EnemyScene.instance()
	self.add_child(Enemy)
	count += 1
	Enemy.global_position = Vector2(360, 9)
