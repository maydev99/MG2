extends CanvasLayer


var coins = 0

func _ready():
	$Coins.text = String(coins)
#	Global.hud = self


func _on_coin_collected():
	coins = coins + 1
	_ready()
	if coins == 20:
		get_tree().change_scene("res://Level1.tscn")
		




