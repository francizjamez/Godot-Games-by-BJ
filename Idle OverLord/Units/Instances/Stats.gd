extends Node

class_name Minion_Stats

signal health_changed(new_health)
signal health_depleted()

export var max_health : int setget set_max_health
export var health : int
export var respawn_time : int

export var damage : int
export var attack_speed : float
export var crit_chance : int
export var crit_damage: int
export var accuracy : float

export var speed : int
export var acceleration : float
export var friction : float

func initialize(stats : UnitStats):
	max_health = stats.max_health
	health = max_health
	respawn_time = stats.respawn_time

	damage = stats.damage
	attack_speed = stats.attack_speed
	crit_chance = stats.crit_chance
	crit_damage = stats.crit_damage
	accuracy = stats.accuracy

	speed = stats.speed
	acceleration = stats.acceleration
	friction = stats.friction
	
func set_max_health(value):
	health = max(0, value)
	
func take_damage(dmg):
	health -= dmg
	health = max(0, health)
	if health <= 0:
		emit_signal("health_depleted")
			
func heal(ammount):
	health += ammount
	health = max(health, max_health)
