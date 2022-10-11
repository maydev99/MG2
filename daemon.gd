extends KinematicBody2D

var speed = 50
var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true

func _ready():
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	
func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)


#Side Checker
func _on_Area2D_body_entered(body):
	print("Ouch")


func _landed_on_head(body):
	print("Squash")
	queue_free()
	
