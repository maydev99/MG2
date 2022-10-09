extends Area2D

export var nextLevel = "res://Level2.tscn"

func _ready():
	$AnimationPlayer.play("butterfly_float")


func _on_door_body_entered(body):
	$AudioStreamPlayer2D.play()
	$Timer.start()

func _on_Timer_timeout():
		get_tree().change_scene(nextLevel)

