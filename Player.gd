extends KinematicBody2D

enum States {AIR = 1, FLOOR}
var state = States.AIR
var velocity = Vector2(0,0)
var coins = 0
const SPEED = 250
const GRAVITY = 35
const JUMPFORCE = -1200




func _physics_process(delta):
	
	print(coins)
	
	match state:
		States.AIR:
			if is_on_floor() and velocity.y == 0:
				state = States.FLOOR
				continue
			$AnimatedSprite.play("jump")
			if Input.is_action_pressed("ui_right"):
				velocity.x = lerp(velocity.x, SPEED, 0.2) if  velocity.x < SPEED else lerp(velocity.x, SPEED, 0.03)
				$AnimatedSprite.flip_h = false
			elif Input.is_action_pressed("ui_left"):
				velocity.x = lerp(velocity.x, -SPEED, 0.2) if  velocity.x > SPEED else lerp(velocity.x, -SPEED, 0.03)
				$AnimatedSprite.flip_h = true
			else:
				velocity.x = lerp(velocity.x, 0, 0.2)
			move_and_fall()
			
		States.FLOOR:
			if not is_on_floor():
				state = States.AIR
				continue
			if Input.is_action_pressed("ui_right"):
					velocity.x = lerp(velocity.x, SPEED, 0.1)
					$AnimatedSprite.play("walk")
					$AnimatedSprite.flip_h = false
			elif Input.is_action_pressed("ui_left"):
					velocity.x = lerp(velocity.x, -SPEED, 0.1)
					$AnimatedSprite.play("walk")
					$AnimatedSprite.flip_h = true
			else:
				$AnimatedSprite.play("idle")
				velocity.x = lerp(velocity.x, 0, 0.2)
				
			if Input.is_action_just_pressed("ui_jump"):
				print("Jump")
				$AudioStreamPlayer2D.play()
				velocity.y = JUMPFORCE
				state = States.AIR
			
			if coins == 20:  #to win
				get_tree().change_scene("res://Level1.tscn")
				
			move_and_fall()
		
	
	



func move_and_fall():
	velocity.y = velocity.y + GRAVITY
	velocity = move_and_slide(velocity, Vector2.UP)
	
func addCoin():
	pass
	
	
