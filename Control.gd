extends Control


func _ready():
	Global.coins = 0


func _on_Button_pressed():
	get_tree().change_scene("res://Level1.tscn")
