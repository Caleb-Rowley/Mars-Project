extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer
var velocity = Vector2(0,0)
var angle
var Player
# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_node("../Player")


func _physics_process(delta):
	velocity = (Player.position - position).normalized() * 100
	velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	if $Area2D.overlaps_body(Player):
		Player.hurt()
		$Area2D/CollisionTimer.start()

func _on_CollisionTimer_timeout():
	Player.hurt()


func _on_Area2D_body_exited(body):
	if !$Area2D.overlaps_body(Player):
		$Area2D/CollisionTimer.stop()
