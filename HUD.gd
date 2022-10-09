extends CanvasLayer


var coins = 0

func _ready():
	pass
	
	
#

#	Global.hud = self


func add_coin_to_hud(coins):
	pass
	
func _process(delta):
	$Coins.text = String(Global.coins)
	


#func _on_coin_collected():
#	_ready()
#	coins = coins + 1
#	if coins == 200:
#		get_tree().change_scene("res://Level1.tscn")
#		









