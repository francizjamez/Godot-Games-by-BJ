extends Control

onready var btn_Battle = $Battle

func _on_Battle_pressed():
	btn_Battle.set_button_icon(preload("res://GUI/Buttons/Battle 2.png"))
	

func _on_Craft_pressed():
	btn_Battle.set_button_icon(preload("res://GUI/Buttons/Battle.png"))
