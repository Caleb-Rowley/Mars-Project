extends CanvasLayer


var Player


# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_node('../Player')


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	$HealthBar.animation = str(Player.health)
	$PowerBar.animation = str(Player.power)
