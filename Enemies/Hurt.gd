extends KinematicBody2D

var timer
var velocity = Vector2(0,0)
var angle
var Player

func _ready():
	Player = get_node("../Player")

func _physics_process(delta):
	velocity = (Player.position - position).normalized() * 100
	velocity = move_and_slide(velocity)

func _on_Area2D_body_entered(body):
	if $Area2D.overlaps_body(Player):
		Player.hurt(1)
		$Area2D/CollisionTimer.start()

func _on_CollisionTimer_timeout():
	if $Area2D.overlaps_body(Player):
		Player.hurt(1)
	else:
		$Area2D/CollisionTimer.stop()
