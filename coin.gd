extends Area2D

signal coin_collected




func _on_coin_body_entered(body):
	Global.add_coin()
	$AnimationPlayer.play("bounce")
	$AudioStreamPlayer2D.play()
	emit_signal("coin_collected")
	set_collision_mask_bit(0, false)
	


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
