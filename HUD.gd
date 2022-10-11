extends CanvasLayer




func _ready():
	$Coins.text = String(Global.coins)
	


func _on_coin_collected():
	_ready()







